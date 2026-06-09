#!/bin/bash

# A reproducer for the Bundler `bundle config set ssl_ca_cert` issue.
#
# The reproducer creates files under the `./tmp` directory and installs
# `rubygems-generate_index` and `webrick` gem.

set -eu -o pipefail

# Parse options.
DEV=0
while [ $# -gt 0 ]; do
    case "${1}" in
        -d|--dev)
            DEV=1
            shift
            ;;
        *)
            echo "Unknown option: ${1}" >&2
            exit 1
            ;;
    esac
done

set -x

TOP_DIR="$(cd "$(dirname "${0}")" && pwd)"
TMP_DIR="${TOP_DIR}/tmp"
BUILD_DIR="${TMP_DIR}/build"
SERVER_DIR="${TMP_DIR}/server"
CLIENT_DIR="${TMP_DIR}/client"
WORK_DIR="${TMP_DIR}/work"
PORT_HTTPS=18443

if [ "${DEV}" -eq 1 ]; then
    RUBYGEMS_DIR="$(pwd)"
    GEM="ruby -I${RUBYGEMS_DIR}/lib ${RUBYGEMS_DIR}/exe/gem"
    BUNDLE="${RUBYGEMS_DIR}/bin/bundle"
else
    GEM="gem"
    BUNDLE="bundle"
fi

${GEM} -v
"${BUNDLE}" -v

# Clean up.
rm -rf "${TMP_DIR}"

# Build a minimal gem.
mkdir -p "${BUILD_DIR}/gem"
cat > "${BUILD_DIR}/gem/hello.gemspec" << 'GEMSPEC'
Gem::Specification.new do |s|
  s.name = "hello"
  s.version = "0.1.0"
  s.summary = "Hello"
  s.authors = ["Test"]
  s.files = []
end
GEMSPEC
pushd "${BUILD_DIR}/gem"
${GEM} build hello.gemspec
popd

# Generate gem index for a RubyGems server.
${GEM} install rubygems-generate_index
mkdir -p \
    "${SERVER_DIR}/gem/gems" \
    "${SERVER_DIR}/gem/cache" \
    "${SERVER_DIR}/gem/specifications"
cp -p "${BUILD_DIR}/gem/hello-0.1.0.gem" "${SERVER_DIR}/gem/gems/"
cp -p "${BUILD_DIR}/gem/hello-0.1.0.gem" "${SERVER_DIR}/gem/cache/"
cp -p "${BUILD_DIR}/gem/hello.gemspec" \
    "${SERVER_DIR}/gem/specifications/hello-0.1.0.gemspec"
${GEM} generate_index -d "${SERVER_DIR}/gem"

# Generate RSA CA and server certificates.
mkdir -p \
    "${BUILD_DIR}/ssl" \
    "${SERVER_DIR}/ssl" \
    "${CLIENT_DIR}/ssl"
openssl req \
    -x509 \
    -newkey rsa:2048 \
    -keyout "${BUILD_DIR}/ssl/ca.key" \
    -subj /CN=CA \
    -nodes \
    -out "${BUILD_DIR}/ssl/ca.crt"
openssl req \
    -newkey rsa:2048 \
    -keyout "${BUILD_DIR}/ssl/server.key" \
    -subj /CN=localhost \
    -addext "subjectAltName=DNS:localhost" \
    -nodes \
    -out "${BUILD_DIR}/ssl/server.csr"
openssl x509 \
    -req \
    -in "${BUILD_DIR}/ssl/server.csr" \
    -CA "${BUILD_DIR}/ssl/ca.crt" \
    -CAkey "${BUILD_DIR}/ssl/ca.key" \
    -CAcreateserial \
    -copy_extensions copyall \
    -out "${BUILD_DIR}/ssl/server.crt"
cp "${BUILD_DIR}/ssl/server.crt" "${SERVER_DIR}/ssl/"
cp "${BUILD_DIR}/ssl/server.key" "${SERVER_DIR}/ssl/"
cp "${BUILD_DIR}/ssl/ca.crt" "${CLIENT_DIR}/ssl/"

# Start the WEBrick HTTPS server emulating a RubyGems server.
${GEM} install webrick
mkdir -p "${SERVER_DIR}/log"
ruby "${TOP_DIR}/server.rb" \
    "${PORT_HTTPS}" \
    "${SERVER_DIR}/gem" \
    "${SERVER_DIR}/ssl/server.crt" \
    "${SERVER_DIR}/ssl/server.key" \
    > "${SERVER_DIR}/log/server.log" 2>&1 &
SERVER_PID="${!}"
trap 'kill ${SERVER_PID} 2>/dev/null || true' EXIT
sleep 3

# Run `bundle install` with `ssl_ca_cert`.
mkdir -p "${WORK_DIR}"
pushd "${WORK_DIR}"
# The `bundle config set --local ssl_ca_cert` command doesn't work.
"${BUNDLE}" config set --local ssl_ca_cert "${CLIENT_DIR}/ssl/ca.crt"
# The following workaround with SSL_CERT_FILE works.
# export SSL_CERT_FILE="${CLIENT_DIR}/ssl/ca.crt"
"${BUNDLE}" config set --local path vendor/bundle
"${BUNDLE}" config list

cat > Gemfile << GEMFILE
source 'https://localhost:${PORT_HTTPS}'

gem "hello", "0.1.0"
GEMFILE

# Debug with ruby/debug.
# rdbg -c \
#     -e "b Bundler::Source::Rubygems#download_gem" \
#     -e "b Gem::Request.configure_connection_for_https" \
#     -e "c" \
#     -- "${BUNDLE}" install -V
"${BUNDLE}" install -V
popd

echo "OK"
