# report-bundler-bundle-config-set-ssl_ca_cert

```
$ which ruby
~/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/bin/ruby
```

## Error with `bundle config set ssl_ca_cert /path/to/ca`

Run the reproducing script:

```
$ ./test.sh
...
+ bundle config set --local ssl_ca_cert /home/jaruga/git/report-bundler-bundle-config-set-ssl_ca_cert/tmp/client/ssl/ca.crt
...
+ bundle install
127.0.0.1 - - [03/Jun/2026:19:29:12 WEST] "GET /versions HTTP/1.1" 206 1
- -> /versions
127.0.0.1 - - [03/Jun/2026:19:29:12 WEST] "GET /versions HTTP/1.1" 200 87
- -> /versions
Fetching gem metadata from https://localhost:18443/.
Resolving dependencies...
Fetching hello 0.1.0
[2026-06-03 19:29:12] ERROR OpenSSL::SSL::SSLError: SSL_accept returned=1 errno=0 peeraddr=127.0.0.1:43856 state=error: tlsv1 alert unknown ca (SSL alert number 48)
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/server.rb:301:in 'OpenSSL::SSL::SSLSocket#accept'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/server.rb:301:in 'block (2 levels) in WEBrick::GenericServer#start_thread'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/utils.rb:258:in 'WEBrick::Utils.timeout'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/server.rb:299:in 'block in WEBrick::GenericServer#start_thread'

Retrying download gem from https://localhost:18443/ due to error (2/4): Gem::RemoteFetcher::FetchError SSL_connect returned=1 errno=0 peeraddr=127.0.0.1:18443 state=error: certificate verify failed (unable to get local issuer certificate) (https://localhost:18443/gems/hello-0.1.0.gem)
[2026-06-03 19:29:13] ERROR OpenSSL::SSL::SSLError: SSL_accept returned=1 errno=0 peeraddr=127.0.0.1:43872 state=error: tlsv1 alert unknown ca (SSL alert number 48)
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/server.rb:301:in 'OpenSSL::SSL::SSLSocket#accept'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/server.rb:301:in 'block (2 levels) in WEBrick::GenericServer#start_thread'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/utils.rb:258:in 'WEBrick::Utils.timeout'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/server.rb:299:in 'block in WEBrick::GenericServer#start_thread'

Retrying download gem from https://localhost:18443/ due to error (3/4): Gem::RemoteFetcher::FetchError SSL_connect returned=1 errno=0 peeraddr=127.0.0.1:18443 state=error: certificate verify failed (unable to get local issuer certificate) (https://localhost:18443/gems/hello-0.1.0.gem)
[2026-06-03 19:29:15] ERROR OpenSSL::SSL::SSLError: SSL_accept returned=1 errno=0 peeraddr=(null) state=error: tlsv1 alert unknown ca (SSL alert number 48)
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/server.rb:301:in 'OpenSSL::SSL::SSLSocket#accept'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/server.rb:301:in 'block (2 levels) in WEBrick::GenericServer#start_thread'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/utils.rb:258:in 'WEBrick::Utils.timeout'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/server.rb:299:in 'block in WEBrick::GenericServer#start_thread'

Retrying download gem from https://localhost:18443/ due to error (4/4): Gem::RemoteFetcher::FetchError SSL_connect returned=1 errno=0 peeraddr=127.0.0.1:18443 state=error: certificate verify failed (unable to get local issuer certificate) (https://localhost:18443/gems/hello-0.1.0.gem)
[2026-06-03 19:29:19] ERROR OpenSSL::SSL::SSLError: SSL_accept returned=1 errno=0 peeraddr=127.0.0.1:47794 state=error: tlsv1 alert unknown ca (SSL alert number 48)
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/server.rb:301:in 'OpenSSL::SSL::SSLSocket#accept'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/server.rb:301:in 'block (2 levels) in WEBrick::GenericServer#start_thread'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/utils.rb:258:in 'WEBrick::Utils.timeout'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/server.rb:299:in 'block in WEBrick::GenericServer#start_thread'

Bundler::HTTPError: Could not download gem from https://localhost:18443/ due to underlying error <SSL_connect returned=1 errno=0 peeraddr=127.0.0.1:18443 state=error: certificate verify failed (unable to get local issuer
certificate) (https://localhost:18443/gems/hello-0.1.0.gem)>
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
[2026-06-03 19:29:19] ERROR OpenSSL::SSL::SSLError: SSL_read: unexpected eof while reading
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/openssl/buffering.rb:76:in 'OpenSSL::SSL::SSLSocket#sysread'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/openssl/buffering.rb:76:in 'OpenSSL::Buffering#fill_rbuff'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/openssl/buffering.rb:335:in 'OpenSSL::Buffering#eof?'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/httpserver.rb:82:in 'WEBrick::HTTPServer#run'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/server.rb:309:in 'block in WEBrick::GenericServer#start_thread'
+ kill 3120269
[2026-06-03 19:29:19] INFO  going to shutdown ...
[2026-06-03 19:29:19] INFO  WEBrick::HTTPServer#start done.
```

## Workaround with `export SSL_CERT_FILE=/path/to/ca`

Change the `test.sh` as follows.

```diff
diff --git a/test.sh b/test.sh
index 972066b..84ea442 100755
--- a/test.sh
+++ b/test.sh
@@ -92,9 +92,9 @@ sleep 3
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
+ export SSL_CERT_FILE=/home/jaruga/git/report-bundler-bundle-config-set-ssl_ca_cert/tmp/client/ssl/ca.crt
+ SSL_CERT_FILE=/home/jaruga/git/report-bundler-bundle-config-set-ssl_ca_cert/tmp/client/ssl/ca.crt
...
+ bundle install
127.0.0.1 - - [03/Jun/2026:19:25:41 WEST] "GET /versions HTTP/1.1" 206 1
- -> /versions
127.0.0.1 - - [03/Jun/2026:19:25:41 WEST] "GET /versions HTTP/1.1" 200 87
- -> /versions
Fetching gem metadata from https://localhost:18443/.
Resolving dependencies...
Fetching hello 0.1.0
127.0.0.1 - - [03/Jun/2026:19:25:41 WEST] "GET /gems/hello-0.1.0.gem HTTP/1.1" 200 4096
- -> /gems/hello-0.1.0.gem
Installing hello 0.1.0
Bundle complete! 1 Gemfile dependency, 1 gem now installed.
Bundled gems are installed into `./vendor/bundle`
[2026-06-03 19:25:41] ERROR OpenSSL::SSL::SSLError: SSL_read: unexpected eof while reading
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/openssl/buffering.rb:76:in 'OpenSSL::SSL::SSLSocket#sysread'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/openssl/buffering.rb:76:in 'OpenSSL::Buffering#fill_rbuff'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/openssl/buffering.rb:335:in 'OpenSSL::Buffering#eof?'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/httpserver.rb:82:in 'WEBrick::HTTPServer#run'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/server.rb:309:in 'block in WEBrick::GenericServer#start_thread'
[2026-06-03 19:25:41] ERROR OpenSSL::SSL::SSLError: SSL_read: unexpected eof while reading
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/openssl/buffering.rb:76:in 'OpenSSL::SSL::SSLSocket#sysread'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/openssl/buffering.rb:76:in 'OpenSSL::Buffering#fill_rbuff'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/4.1.0+1/openssl/buffering.rb:335:in 'OpenSSL::Buffering#eof?'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/httpserver.rb:82:in 'WEBrick::HTTPServer#run'
	/home/jaruga/.local/ruby-4.1.0-debug-3ef48ef9c8-openssl-4.1.0-7194354488/lib/ruby/gems/4.1.0+1/gems/webrick-1.9.2/lib/webrick/server.rb:309:in 'block in WEBrick::GenericServer#start_thread'
+ popd
~/git/report-bundler-bundle-config-set-ssl_ca_cert
+ echo OK
OK
+ kill 3119629
[2026-06-03 19:25:41] INFO  going to shutdown ...
[2026-06-03 19:25:41] INFO  WEBrick::HTTPServer#start done.
```
