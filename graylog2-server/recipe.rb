class Graylog2Server < FPM::Cookery::Recipe
  homepage    'http://graylog2.org'
  source      'https://github.com/downloads/Graylog2/graylog2-server/graylog2-server-0.9.6p1.tar.gz'
  md5         '499ae16dcae71eeb7c3a30c75ea7a1a6'

  name        'graylog2-server'
  version     '0.9.6p1'
  revision    '1'
  vendor      'aussielunix'
  description 'graylog2-server is the server part of an open source log management solution that stores your logs in elasticsearch.'
  arch	      'all'
  section     'admin'

  depends = 'default-jre-headless'

  config_files '/etc/graylog2.conf'

  def build
    inreplace 'bin/graylog2ctl' do |s|
      s.gsub! '../graylog2-server.jar', share('graylog2-server/graylog2-server.jar')
    end

    inline_replace 'graylog2.conf.example' do |s|
      s.gsub! 'mongodb_useauth = true', 'mongodb_useauth = false'
    end
  end

  def install
    bin.install 'bin/graylog2ctl'
    etc('init').install_p workdir('graylog2-server.upstart'), 'graylog2-server.conf'
    etc.install_p 'graylog2.conf.example', 'graylog2.conf'
    share('graylog2-server').install workdir('COPYING')
    share('graylog2-server').install workdir('README')
    share('graylog2-server').install 'build_date'
    share('graylog2-server').install 'graylog2-server.jar'
  end
end
