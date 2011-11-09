class Icinga < FPM::Cookery::Recipe
  description 'enterprise grade open source monitoring system'

  name     'icinga'
  version  '1.5.1'
  revision 0
  homepage 'http://icinga.org/'
  source   "http://downloads.sourceforge.net/project/icinga/icinga/#{version}/icinga-#{version}.tar.gz"
  sha256   'b2cc23ab8b96e9409ce3e7ed4a0e1aabea7f9b4e9d521f5ed23a99ea1c9ec37b'

  section      'net'
  #config_files '/etc/redis/redis.conf'

  build_depends 'libgd2-xpm-dev'

  depends 'coreutils (>= 4.5.3)', 'bsd-mailx | mailx', 'adduser',
          'lsb-base (>= 3.0-3)', 'ucf', 'libgd2-xpm'

  def build
    configure \
      '--disable-idoutils',
      '--enable-ssl',
      :prefix => prefix,
      :sysconfdir => etc('icinga'),
      :localstatedir => '/var/lib/icinga',
      :with_log_dir => '/var/log/icinga',
      :with_cgi_log_dir => '/var/log/icinga/cgi',
      :with_phpapi_log_dir => '/var/log/icinga/php-api'

    make :all
  end

  def install
    make :install, 'DESTDIR' => destdir, 'INSTALL_OPTS' => '',
                   'COMMAND_OPTS' => '', 'INSTALL_OPTS_WEB' => '',
                   'HTMLDIR' => '/usr/share/icinga/htdocs',
                   'CGIDIR' => '/usr/lib/cgi-bin/icinga'
#    %w(run lib/redis log/redis).each { |p| var(p).mkpath }

#    bin.install Dir["src/redis-*"].select{ |f| f =~ /redis-[^\.]+$/ }

#    etc('redis').install "redis.conf"
#    etc('init.d').install_p(workdir('redis-server.init.d'), 'redis-server')
  end
end
