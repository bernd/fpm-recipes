class Icinga < FPM::Cookery::Recipe
  description 'enterprise grade open source monitoring system'

  name     'icinga'
  version  '1.6.1'
  revision 0
  homepage 'http://icinga.org/'
  source   "http://downloads.sourceforge.net/project/icinga/icinga/#{version}/icinga-#{version}.tar.gz"
  sha256   '80b980272dd45bcd14b79d98b1125d6aa4184c20644863f71d9f3e00fbced89b'

  section      'net'

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


    # Install the sample config files.
    doc('icinga').mkpath
    cp_r 'sample-config', doc('icinga')
    rm Dir["#{doc('icinga/sample-config')}/**/*.in"]
  end
end
