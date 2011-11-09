class Icinga < FPM::Cookery::Recipe
  description 'enterprise grade open source monitoring system'

  name     'icinga-web'
  version  '1.5.2'
  revision 0
  homepage 'http://icinga.org/'
  source   "http://downloads.sourceforge.net/project/icinga/icinga-web/#{version}/icinga-web-#{version}.tar.gz"
  sha256   '62ca20da6816e0124137b79ade140b6c4e6a59220429420e27e274621cb696ac'

  section      'net'
  #config_files '/etc/redis/redis.conf'

  build_depends 'libgd2-xpm-dev'

  depends 'icinga'

  def build
    configure :prefix => prefix('share/icinga-web/htdocs'),
              :sysconfdir => '/etc/icinga-web'
    make
  end

  def install
    make :install, 'DESTDIR' => destdir, 'INSTALL_OPTS_CACHE' => '',
                   'INSTALL_OPTS_WEB' => '', 'INSTALL_OPTS' => ''

#    %w(run lib/redis log/redis).each { |p| var(p).mkpath }

#    bin.install Dir["src/redis-*"].select{ |f| f =~ /redis-[^\.]+$/ }

#    etc('redis').install "redis.conf"
#    etc('init.d').install_p(workdir('redis-server.init.d'), 'redis-server')
  end
end
