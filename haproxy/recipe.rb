require 'fpm/package/python'

class Haproxy < FPM::Cookery::Recipe
  homepage 'http://haproxy.1wt.eu/'
  source 'http://haproxy.1wt.eu/download/1.5/src/devel/haproxy-1.5-dev17.tar.gz'
  md5 'b8deab9989e6b9925410b0bc44dd4353'

  name 'haproxy'
  version '1.5.dev17'
  revision '1'

  description 'The Reliable, High Performance TCP/HTTP Load Balancer'

  depends 'openssl', 'pcre', 'zlib'
  build_depends 'openssl-devel', 'pcre-devel', 'zlib-devel'

  config_files '/etc/haproxy/haproxy.cfg'

  pre_install 'pre-install'
  post_install 'post-install'
  pre_uninstall 'pre-uninstall'
  post_uninstall 'post-uninstall'

  # WARNING: This blindly assumes a new kernel and building on the target box.
  def build
    make 'TARGET' => 'linux2628', 'CPU' => 'native', 'USE_PCRE' => '1', 'USE_OPENSSL' => '1', 'USE_ZLIB' => '1'

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
    safesystem '/bin/gzip', man1('haproxy.1')

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
