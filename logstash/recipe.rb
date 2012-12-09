class Logstash < FPM::Cookery::Recipe
  homepage    'http://logstash.net/'
  name        'logstash'
  version     '1.1.5'
  source      "https://logstash.objects.dreamhost.com/release/#{name}-#{version}-monolithic.jar"
  md5         '8f9d5b94a771a451a7f361e6a306589e'

  revision    '1'
  vendor      'aussielunix'
  maintainer  'Mick Pollard <aussielunix@gmail.com>'
  license     'Apache 2'
  description 'logstash is a tool for managing events and logs. You can use it to collect logs, parse them, and store them for later use (like, for searching).'
  arch	      'all'
  section     'admin'

  depends     'java-runtime-headless'

  config_files '/etc/logstash/logstash.conf'

  pre_install    'preinst'
  post_install   'postinst'

  pre_uninstall  'prerm'
  post_uninstall 'postrm'

  def build
    
  end

  def install
    etc('init.d').install_p workdir('init.d'), 'logstash'
    etc('logstash').install_p workdir('logstash.conf.example'), 'logstash.conf'

    share('logstash').install_p "#{name}-#{version}-monolithic.jar", 'logstash.jar'
  end
end
