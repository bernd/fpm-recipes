class Graylog2Server < FPM::Cookery::Recipe
  homepage    'http://graylog2.org'
  name        'graylog2-server'
  version     '0.12.0'
  source      "https://github.com/Graylog2/#{name}/releases/download/#{version}/#{name}-#{version}.tar.gz"
  md5         '31886d2b68da880a59c44ce4e9e3c734'
  sha1        '9c4280608edc6659626b49255eb09943f5d53b3b'
  sha256      '2c29ea676a43e1158fb2e590ddca95254d3b3d6120c9ac710b2dd02c688d74c5'

  revision    '1'
  vendor      'aussielunix'
  maintainer  'Mick Pollard <aussielunix@gmail.com>'
  license     'GPL-3'
  description 'graylog2-server is the server part of an open source log management solution that stores your logs in Elasticsearch.'
  arch	      'all'
  section     'admin'

  depends     'java-runtime-headless', 'mongodb | mongodb-10gen', 'elasticsearch'

  config_files '/etc/graylog2.conf elasticsearch.yml.example'

  def build
    inline_replace 'bin/graylog2ctl' do |s|
      s.gsub! 'GRAYLOG2_SERVER_JAR=graylog2-server.jar', 'GRAYLOG2_SERVER_JAR=' + share('graylog2-server/graylog2-server.jar')
      s.gsub! 'LOG_FILE=log/graylog2-server.log', 'LOG_FILE=' + var('log/graylog2-server.log')
    end

    inline_replace 'graylog2.conf.example' do |s|
      s.gsub! 'mongodb_useauth = true', 'mongodb_useauth = false'
      s.gsub! 'mongodb_host = localhost', 'mongodb_host = 127.0.0.1'
    end
  end

  def install
    bin.install 'bin/graylog2ctl'

    case FPM::Cookery::Facts.platform
    when :ubuntu
      etc('init').install_p workdir('graylog2-server.upstart'), 'graylog2-server.conf'
    when :debian
      etc('init.d').install_p workdir('graylog2-server.initd'), 'graylog2-server'
      etc('default').install_p workdir('graylog2-server.confd'), 'graylog2-server'
    end

    etc.install_p 'graylog2.conf.example', 'graylog2.conf'
    etc.install_p 'elasticsearch.yml.example', 'graylog2-elasticsearch.yml'

    share('graylog2-server').install workdir('COPYING')
    share('graylog2-server').install workdir('README')
    share('graylog2-server').install 'build_date'
    share('graylog2-server').install 'plugin'
    share('graylog2-server').install 'graylog2-server.jar'
  end
end
