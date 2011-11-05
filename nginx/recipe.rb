class Nginx < FPM::Cookery::Recipe
  description 'a high performance web server and a reverse proxy server'

  name     'nginx'
  version  '1.0.9'
  homepage 'http://nginx.org/'
  source   "http://nginx.org/download/nginx-#{version}.tar.gz"
  sha256   'e834b6f202b786f3b985315c24dcbd67c619d563ea03329d75a9ac667e138fff'

  section 'httpd'

  build_depends 'libpcre3-dev', 'zlib1g-dev', 'libssl-dev (<< 1.0.0)'
  depends       'libpcre3', 'zlib1g', 'libssl0.9.8'

  provides  'nginx-full', 'nginx-common'
  replaces  'nginx-full', 'nginx-common'
  conflicts 'nginx-full', 'nginx-common'

  config_files '/etc/nginx/nginx.conf', '/etc/nginx/mime.types',
               '/var/www/nginx-default/index.html'

  def build
    configure \
      '--with-http_stub_status_module',
      '--with-http_ssl_module',
      '--with-http_gzip_static_module',
      '--with-pcre',
      '--with-debug',

      :prefix => prefix,

      :user => 'www-data',
      :group => 'www-data',

      :pid_path => '/var/run/nginx.pid',
      :lock_path => '/var/lock/nginx.lock',
      :conf_path => '/etc/nginx/nginx.conf',
      :http_log_path => '/var/log/nginx/access.log',
      :error_log_path => '/var/log/nginx/error.log',
      :http_proxy_temp_path => '/var/lib/nginx/proxy',
      :http_fastcgi_temp_path => '/var/lib/nginx/fastcgi',
      :http_client_body_temp_path => '/var/lib/nginx/body'

    make
  end

  def install
    # startup script
    (etc/'init.d').install_p(workdir/'nginx.init.d', 'nginx')

    # config files
    (etc/'nginx').install Dir['conf/*']

    # default site
    (var/'www/nginx-default').install Dir['html/*']

    # server
    sbin.install Dir['objs/nginx']

    # man page
    man8.install Dir['objs/nginx.8']
    system 'gzip', man8/'nginx.8'

    # support dirs
    %w( run lock log/nginx lib/nginx ).map do |dir|
      (var/dir).mkpath
    end
  end
end
