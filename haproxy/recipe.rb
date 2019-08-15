require 'mkmf' # For find_executable
require 'fpm/package/python'

class Haproxy < FPM::Cookery::Recipe
  # Info
  homepage 'http://www.haproxy.org/'
  source 'http://www.haproxy.org/download/1.8/src/haproxy-1.8.20.tar.gz'
  md5 'abf9b7b1aa84e0839501e006fc20d7fd'
  name 'haproxy'
  description 'The Reliable, High Performance TCP/HTTP Load Balancer'
  version '1.8.20'
  revision '1'

  # Platforms specific dependencies
  platforms [:debian, :ubuntu] do
    depends 'lua5.3', 'libssl1.0.0', 'zlib1g', 'libpcre3'
    build_depends 'liblua5.3-dev', 'libssl-dev', 'zlib1g-dev', 'libpcre3-dev'
  end
  platforms [:centos, :redhat] do
    depends 'openssl', 'pcre', 'zlib', 'logrotate', 'chkconfig', 'initscripts', 'shadow-utils', 'setup'
    build_depends 'openssl-devel', 'pcre-devel', 'zlib-devel', 'lua-devel'
  end

  config_files '/etc/haproxy/haproxy.cfg'

  pre_install 'pre-install'
  post_install 'post-install'
  pre_uninstall 'pre-uninstall'
  post_uninstall 'post-uninstall'

  def build
    build_flags = {
      'TARGET' => 'linux2628',
    }

    if %w(ubuntu debian).include?(FPM::Cookery::Facts.platform.to_s)
      build_flags['LUA_INC'] = '/usr/include/lua5.3'
    end

    make build_flags

    # halog
    make '-C', 'contrib/halog'
  end

  def install
    with_trueprefix do
      make :install, 'DESTDIR' => destdir, 'PREFIX' => prefix, 'DOCDIR' => haproxy_doc
    end

    etc('haproxy').install workdir('haproxy.cfg')

    etc('logrotate.d').install(workdir('haproxy.logrotate'), 'haproxy')

    etc('rc.d/init.d').install('examples/haproxy.init', 'haproxy')
    chmod 0755, etc('rc.d/init.d/haproxy')

    #GZip man page
    gzip_path = find_executable 'gzip'
    safesystem gzip_path, man1('haproxy.1')

    haproxy_doc.install Dir['doc/*']

    share('haproxy').install Dir['examples/errorfiles/*']

    var('lib/haproxy').mkpath

    # halog
    bin.install 'contrib/halog/halog'
  end

  def haproxy_doc(path = nil)
    doc("haproxy-#{version}")
  end
end
