class Icinga < FPM::Cookery::Recipe
  description 'enterprise grade open source monitoring system'

  name     'icinga-web'
  version  '1.6.1'
  revision 0
  homepage 'http://icinga.org/'
  source   "http://downloads.sourceforge.net/project/icinga/icinga-web/#{version}/icinga-web-#{version}.tar.gz"
  sha256   '41c2d699355c6371447f551730e2dba80a0117f34f0608fa249e292904708ab4'

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
