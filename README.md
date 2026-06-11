# report-bundler-bundle-config-set-ssl_ca_cert

```
$ which ruby
~/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/bin/ruby
```

## RubyGems release version

### Error with `bundle config set ssl_ca_cert /path/to/ca`

Run the reproducing script:

```
$ ./test.sh
...
+ bundle config set --local ssl_ca_cert /home/jaruga/git/report-bundler-bundle-config-set-ssl_ca_cert/tmp/client/ssl/ca.crt
...
+ bundle install -V
Running `bundle install --verbose` with bundler 4.1.0.dev
Resolving dependencies because there's no lockfile
HTTP GET https://localhost:18443/versions
HTTP 206 Partial Content https://localhost:18443/versions
HTTP GET https://localhost:18443/versions
HTTP 200 OK https://localhost:18443/versions
Fetching gem metadata from https://localhost:18443/
Looking up gems ["hello"]
Resolving dependencies...
Using bundler 4.1.0.dev
1:  bundler (4.1.0.dev) from /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/specifications/default/bundler-4.1.0.dev.gemspec
Fetching hello 0.1.0
Retrying download gem from https://localhost:18443/ due to error (2/4): Gem::RemoteFetcher::FetchError SSL_connect returned=1 errno=0 peeraddr=127.0.0.1:18443 state=error: certificate verify failed (unable to get local issuer certificate) (https://localhost:18443/gems/hello-0.1.0.gem)
Sleeping for 1.01 seconds before retry
Retrying download gem from https://localhost:18443/ due to error (3/4): Gem::RemoteFetcher::FetchError SSL_connect returned=1 errno=0 peeraddr=127.0.0.1:18443 state=error: certificate verify failed (unable to get local issuer certificate) (https://localhost:18443/gems/hello-0.1.0.gem)
Sleeping for 2.41 seconds before retry
Retrying download gem from https://localhost:18443/ due to error (4/4): Gem::RemoteFetcher::FetchError SSL_connect returned=1 errno=0 peeraddr=127.0.0.1:18443 state=error: certificate verify failed (unable to get local issuer certificate) (https://localhost:18443/gems/hello-0.1.0.gem)
Sleeping for 4.44 seconds before retry
Bundler::InstallError: Bundler::HTTPError: Could not download gem from https://localhost:18443/ due to underlying error <SSL_connect returned=1 errno=0 peeraddr=127.0.0.1:18443 state=error: certificate verify failed (unable to get local issuer certificate) (https://localhost:18443/gems/hello-0.1.0.gem)>
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/rubygems_integration.rb:406:in 'Bundler::RubygemsIntegration#download_gem'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/source/rubygems.rb:483:in 'block in Bundler::Source::Rubygems#download_gem'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/rubygems.rb:1068:in 'Gem.time'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/source/rubygems.rb:482:in 'Bundler::Source::Rubygems#download_gem'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/source/rubygems.rb:436:in 'Bundler::Source::Rubygems#fetch_gem'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/source/rubygems.rb:420:in 'Bundler::Source::Rubygems#fetch_gem_if_possible'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/source/rubygems.rb:527:in 'Bundler::Source::Rubygems#rubygems_gem_installer'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/source/rubygems.rb:173:in 'Bundler::Source::Rubygems#download'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/installer/gem_installer.rb:29:in 'Bundler::GemInstaller#download'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/installer/parallel_installer.rb:148:in 'Bundler::ParallelInstaller#do_download'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/installer/parallel_installer.rb:132:in 'block in Bundler::ParallelInstaller#worker_pool'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/worker.rb:70:in 'Bundler::Worker#apply_func'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/worker.rb:65:in 'block in Bundler::Worker#process_queue'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/worker.rb:56:in 'Kernel#loop'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/worker.rb:56:in 'Bundler::Worker#process_queue'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/worker.rb:98:in 'block (2 levels) in Bundler::Worker#create_threads'

An error occurred while installing hello (0.1.0), and Bundler cannot continue.

In Gemfile:
  hello

/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/installer/parallel_installer.rb:208:in 'Bundler::ParallelInstaller#handle_error'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/installer/parallel_installer.rb:100:in 'Bundler::ParallelInstaller#call'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/installer/parallel_installer.rb:62:in 'Bundler::ParallelInstaller.call'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/installer.rb:193:in 'Bundler::Installer#install'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/installer.rb:78:in 'block in Bundler::Installer#run'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/rubygems.rb:901:in 'block in Gem.open_file_with_flock'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/rubygems.rb:889:in 'IO.open'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/rubygems.rb:889:in 'Gem.open_file_with_flock'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/rubygems.rb:875:in 'Gem.open_file_with_lock'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/process_lock.rb:13:in 'block in Bundler::ProcessLock.lock'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/shared_helpers.rb:106:in 'Bundler::SharedHelpers#filesystem_access'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/process_lock.rb:12:in 'Bundler::ProcessLock.lock'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/installer.rb:65:in 'Bundler::Installer#run'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/installer.rb:17:in 'Bundler::Installer.install'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/cli/install.rb:50:in 'Bundler::CLI::Install#run'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/cli.rb:295:in 'block in Bundler::CLI#install'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/settings.rb:146:in 'Bundler::Settings#temporary'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/cli.rb:294:in 'Bundler::CLI#install'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/vendor/thor/lib/thor/command.rb:28:in 'Bundler::Thor::Command#run'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/vendor/thor/lib/thor/invocation.rb:127:in 'Bundler::Thor::Invocation#invoke_command'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/vendor/thor/lib/thor.rb:538:in 'Bundler::Thor.dispatch'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/cli.rb:35:in 'Bundler::CLI.dispatch'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/vendor/thor/lib/thor/base.rb:584:in 'Bundler::Thor::Base::ClassMethods#start'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/cli.rb:29:in 'Bundler::CLI.start'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/bundler-4.1.0.dev/exe/bundle:28:in 'block in <top (required)>'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/bundler/friendly_errors.rb:118:in 'Bundler.with_friendly_errors'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/bundler-4.1.0.dev/exe/bundle:20:in '<top (required)>'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/rubygems.rb:306:in 'Kernel#load'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/rubygems.rb:306:in 'Gem.activate_and_load_bin_path'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/bin/bundle:25:in '<main>'
+ kill 3196682
```

### Workaround with `export SSL_CERT_FILE=/path/to/ca`

Change the `test.sh` as follows.

```diff
diff --git a/test.sh b/test.sh
index 5893daf..208284d 100755
--- a/test.sh
+++ b/test.sh
@@ -97,9 +97,9 @@ sleep 3
 mkdir -p "${WORK_DIR}"
 pushd "${WORK_DIR}"
 # The `bundle config set --local ssl_ca_cert` command doesn't work.
-"${BUNDLE}" config set --local ssl_ca_cert "${CLIENT_DIR}/ssl/ca.crt"
+# "${BUNDLE}" config set --local ssl_ca_cert "${CLIENT_DIR}/ssl/ca.crt"
 # The following workaround with SSL_CERT_FILE works.
-# export SSL_CERT_FILE="${CLIENT_DIR}/ssl/ca.crt"
+export SSL_CERT_FILE="${CLIENT_DIR}/ssl/ca.crt"
 "${BUNDLE}" config set --local path vendor/bundle
 "${BUNDLE}" config list

```

Run the reproducing script:

```
$ ./test.sh
...
+ export SSL_CERT_FILE=/home/jaruga/var/git/report-bundler-bundle-config-set-ssl_ca_cert/tmp/client/ssl/ca.crt
+ SSL_CERT_FILE=/home/jaruga/var/git/report-bundler-bundle-config-set-ssl_ca_cert/tmp/client/ssl/ca.crt
+ bundle config set --local path vendor/bundle
...
+ bundle install -V
Running `bundle install --verbose` with bundler 4.1.0.dev
Resolving dependencies because there's no lockfile
HTTP GET https://localhost:18443/versions
HTTP 206 Partial Content https://localhost:18443/versions
HTTP GET https://localhost:18443/versions
HTTP 200 OK https://localhost:18443/versions
Fetching gem metadata from https://localhost:18443/
Looking up gems ["hello"]
Resolving dependencies...
Using bundler 4.1.0.dev
1:  bundler (4.1.0.dev) from /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/specifications/default/bundler-4.1.0.dev.gemspec
Fetching hello 0.1.0
Downloaded hello in: 0.055s
Installing hello 0.1.0
Installed hello in: 0.004s
3:  hello (0.1.0) from /home/jaruga/var/git/report-bundler-bundle-config-set-ssl_ca_cert/tmp/work/vendor/bundle/ruby/4.1.0+1/specifications/hello-0.1.0.gemspec
Bundle complete! 1 Gemfile dependency, 1 gem now installed.
Bundled gems are installed into `./vendor/bundle`
+ popd
~/var/git/report-bundler-bundle-config-set-ssl_ca_cert
+ echo OK
OK
+ kill 3195000
```

## ruby/rubygems development version

This was tested at the ruby/rubygems latest master branch commit `ruby/rubygems@f22056bd50c7c179ccfcf45e2f49a13a44afcf92`.

### Error with `bundle config set ssl_ca_cert /path/to/ca`

Run the reproducing script on development mode:

```
$ pwd
/home/jaruga/git/ruby/rubygems

$ ~/git/report-bundler-bundle-config-set-ssl_ca_cert/test.sh
...
+ /home/jaruga/git/ruby/rubygems/bin/bundle config set --local ssl_ca_cert /home/jaruga/git/report-bundler-bundle-config-set-ssl_ca_cert/tmp/client/ssl/ca.crt
...
+ /home/jaruga/git/ruby/rubygems/bin/bundle install -V
Running `bundle install --verbose` with bundler 4.1.0.dev
Resolving dependencies because there's no lockfile
HTTP GET https://localhost:18443/versions
HTTP 206 Partial Content https://localhost:18443/versions
HTTP GET https://localhost:18443/versions
HTTP 200 OK https://localhost:18443/versions
Fetching gem metadata from https://localhost:18443/
Looking up gems ["hello"]
Resolving dependencies...
Fetching hello 0.1.0
Using bundler 4.1.0.dev
1:  bundler (4.1.0.dev) from /home/jaruga/var/git/ruby/rubygems/bundler/bundler.gemspec
Retrying download gem from https://localhost:18443/ due to error (2/4): Gem::RemoteFetcher::FetchError SSL_connect returned=1 errno=0 peeraddr=127.0.0.1:18443 state=error: certificate verify failed (unable to get local issuer certificate) (https://localhost:18443/gems/hello-0.1.0.gem)
Sleeping for 1.27 seconds before retry
Retrying download gem from https://localhost:18443/ due to error (3/4): Gem::RemoteFetcher::FetchError SSL_connect returned=1 errno=0 peeraddr=127.0.0.1:18443 state=error: certificate verify failed (unable to get local issuer certificate) (https://localhost:18443/gems/hello-0.1.0.gem)
Sleeping for 2.41 seconds before retry
Retrying download gem from https://localhost:18443/ due to error (4/4): Gem::RemoteFetcher::FetchError SSL_connect returned=1 errno=0 peeraddr=127.0.0.1:18443 state=error: certificate verify failed (unable to get local issuer certificate) (https://localhost:18443/gems/hello-0.1.0.gem)
Sleeping for 4.45 seconds before retry
Bundler::InstallError: Bundler::HTTPError: Could not download gem from https://localhost:18443/ due to underlying error <SSL_connect returned=1 errno=0 peeraddr=127.0.0.1:18443 state=error: certificate verify failed (unable to get local issuer certificate) (https://localhost:18443/gems/hello-0.1.0.gem)>
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/rubygems_integration.rb:406:in 'Bundler::RubygemsIntegration#download_gem'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/source/rubygems.rb:531:in 'block in Bundler::Source::Rubygems#download_gem'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/rubygems.rb:1068:in 'Gem.time'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/source/rubygems.rb:530:in 'Bundler::Source::Rubygems#download_gem'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/source/rubygems.rb:459:in 'Bundler::Source::Rubygems#fetch_gem'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/source/rubygems.rb:443:in 'Bundler::Source::Rubygems#fetch_gem_if_possible'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/source/rubygems.rb:575:in 'Bundler::Source::Rubygems#rubygems_gem_installer'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/source/rubygems.rb:184:in 'Bundler::Source::Rubygems#download'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/installer/gem_installer.rb:29:in 'Bundler::GemInstaller#download'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/installer/parallel_installer.rb:148:in 'Bundler::ParallelInstaller#do_download'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/installer/parallel_installer.rb:132:in 'block in Bundler::ParallelInstaller#worker_pool'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/worker.rb:70:in 'Bundler::Worker#apply_func'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/worker.rb:65:in 'block in Bundler::Worker#process_queue'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/worker.rb:56:in 'Kernel#loop'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/worker.rb:56:in 'Bundler::Worker#process_queue'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/worker.rb:98:in 'block (2 levels) in Bundler::Worker#create_threads'

An error occurred while installing hello (0.1.0), and Bundler cannot continue.

In Gemfile:
  hello

/home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/installer/parallel_installer.rb:208:in 'Bundler::ParallelInstaller#handle_error'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/installer/parallel_installer.rb:100:in 'Bundler::ParallelInstaller#call'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/installer/parallel_installer.rb:62:in 'Bundler::ParallelInstaller.call'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/installer.rb:198:in 'Bundler::Installer#install'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/installer.rb:83:in 'block in Bundler::Installer#run'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/rubygems.rb:901:in 'block in Gem.open_file_with_flock'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/rubygems.rb:889:in 'IO.open'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/rubygems.rb:889:in 'Gem.open_file_with_flock'
  /home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/rubygems.rb:875:in 'Gem.open_file_with_lock'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/process_lock.rb:13:in 'block in Bundler::ProcessLock.lock'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/shared_helpers.rb:106:in 'Bundler::SharedHelpers#filesystem_access'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/process_lock.rb:12:in 'Bundler::ProcessLock.lock'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/installer.rb:65:in 'Bundler::Installer#run'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/installer.rb:17:in 'Bundler::Installer.install'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/cli/install.rb:50:in 'Bundler::CLI::Install#run'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/cli.rb:296:in 'block in Bundler::CLI#install'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/settings.rb:147:in 'Bundler::Settings#temporary'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/cli.rb:295:in 'Bundler::CLI#install'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/vendor/thor/lib/thor/command.rb:28:in 'Bundler::Thor::Command#run'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/vendor/thor/lib/thor/invocation.rb:127:in 'Bundler::Thor::Invocation#invoke_command'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/vendor/thor/lib/thor.rb:538:in 'Bundler::Thor.dispatch'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/cli.rb:35:in 'Bundler::CLI.dispatch'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/vendor/thor/lib/thor/base.rb:584:in 'Bundler::Thor::Base::ClassMethods#start'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/cli.rb:29:in 'Bundler::CLI.start'
  /home/jaruga/var/git/ruby/rubygems/bundler/exe/bundle:28:in 'block in <top (required)>'
  /home/jaruga/var/git/ruby/rubygems/bundler/lib/bundler/friendly_errors.rb:118:in 'Bundler.with_friendly_errors'
  /home/jaruga/var/git/ruby/rubygems/bundler/exe/bundle:20:in '<top (required)>'
  /home/jaruga/git/ruby/rubygems/bin/bundle:6:in 'Kernel#load'
  /home/jaruga/git/ruby/rubygems/bin/bundle:6:in '<main>'
+ kill 3210202
```

### Workaround with `export SSL_CERT_FILE=/path/to/ca`

Change the `test.sh` as follows.

```diff
diff --git a/test.sh b/test.sh
index 6bc9d51..153a8bd 100755
--- a/test.sh
+++ b/test.sh
@@ -121,9 +121,9 @@ sleep 3
 mkdir -p "${WORK_DIR}"
 pushd "${WORK_DIR}"
 # The `bundle config set --local ssl_ca_cert` command doesn't work.
-"${BUNDLE}" config set --local ssl_ca_cert "${CLIENT_DIR}/ssl/ca.crt"
+# "${BUNDLE}" config set --local ssl_ca_cert "${CLIENT_DIR}/ssl/ca.crt"
 # The following workaround with SSL_CERT_FILE works.
-# export SSL_CERT_FILE="${CLIENT_DIR}/ssl/ca.crt"
+export SSL_CERT_FILE="${CLIENT_DIR}/ssl/ca.crt"
 "${BUNDLE}" config set --local path vendor/bundle
 "${BUNDLE}" config list

```

Run the reproducing script on development mode:

```
$ pwd
/home/jaruga/git/ruby/rubygems

$ ~/git/report-bundler-bundle-config-set-ssl_ca_cert/test.sh -d
...
+ export SSL_CERT_FILE=/home/jaruga/git/report-bundler-bundle-config-set-ssl_ca_cert/tmp/client/ssl/ca.crt
+ SSL_CERT_FILE=/home/jaruga/git/report-bundler-bundle-config-set-ssl_ca_cert/tmp/client/ssl/ca.crt
...
+ /home/jaruga/git/ruby/rubygems/bin/bundle install -V
Running `bundle install --verbose` with bundler 4.1.0.dev
Resolving dependencies because there's no lockfile
HTTP GET https://localhost:18443/versions
HTTP 206 Partial Content https://localhost:18443/versions
HTTP GET https://localhost:18443/versions
HTTP 200 OK https://localhost:18443/versions
Fetching gem metadata from https://localhost:18443/
Looking up gems ["hello"]
Resolving dependencies...
Fetching hello 0.1.0
Using bundler 4.1.0.dev
1:  bundler (4.1.0.dev) from /home/jaruga/var/git/ruby/rubygems/bundler/bundler.gemspec
Downloaded hello in: 0.054s
Installing hello 0.1.0
Installed hello in: 0.002s
2:  hello (0.1.0) from /home/jaruga/var/git/report-bundler-bundle-config-set-ssl_ca_cert/tmp/work/vendor/bundle/ruby/4.1.0+1/specifications/hello-0.1.0.gemspec
Bundle complete! 1 Gemfile dependency, 1 gem now installed.
Bundled gems are installed into `./vendor/bundle`
+ popd
~/git/ruby/rubygems
+ echo OK
OK
+ kill 3211256
```

See full log files in [log/dev](log/dev) directory.
