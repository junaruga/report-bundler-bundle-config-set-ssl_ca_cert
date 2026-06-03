#!/usr/bin/env ruby
# frozen_string_literal: true

require "webrick"
require "webrick/https"
require "openssl"

port = ARGV[0]
doc_root = ARGV[1]
ssl_cert = ARGV[2]
ssl_key = ARGV[3]

server = WEBrick::HTTPServer.new(
  Port: port.to_i,
  BindAddress: "127.0.0.1",
  DocumentRoot: doc_root,
  SSLEnable: true,
  SSLCertificate: OpenSSL::X509::Certificate.new(File.read(ssl_cert)),
  SSLPrivateKey: OpenSSL::PKey.read(File.read(ssl_key)),
  Logger: WEBrick::Log.new($stderr, WEBrick::Log::INFO)
)

trap("INT") { server.shutdown }
trap("TERM") { server.shutdown }

server.start
