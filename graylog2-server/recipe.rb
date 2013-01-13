class Graylog2Server < FPM::Cookery::Recipe
  homepage    'http://graylog2.org'
  name        'graylog2-server'
  version     '0.10.0-rc.2'
  source      "https://s3-eu-west-1.amazonaws.com/graylog2-releases/#{name}/#{name}-#{version}.tar.gz"
  md5         'ad56021aeb2c42ebd68874a559fd2ce0'

  revision    '1'
  vendor      'aussielunix'
  maintainer  'Mick Pollard <aussielunix@gmail.com>'
  license     'GPL-3'
  description 'graylog2-server is the server part of an open source log management solution that stores your logs in elasticsearch.'
  arch	      'all'
  section     'admin'

  depends     'java-runtime-headless'

  config_files '/etc/graylog2.conf'

  def build
    inreplace 'bin/graylog2ctl' do |s|
      s.gsub! '../graylog2-server.jar', share('graylog2-server/graylog2-server.jar')
    end

    inline_replace 'graylog2.conf.example' do |s|
      s.gsub! 'mongodb_useauth = true', 'mongodb_useauth = false'
      s.gsub! 'mongodb_host = localhost', 'mongodb_host = 127.0.0.1'
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
