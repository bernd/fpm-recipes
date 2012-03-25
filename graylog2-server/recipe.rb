class Graylog2Web < FPM::Cookery::Recipe
    homepage    'http://graylog2.org'
    source      'https://github.com/downloads/Graylog2/graylog2-server/graylog2-server-0.9.6p1-RC1.tar.gz'
    md5         '25c5fb08fe9f0466444c558358e9e5e4'

    name        'graylog2-server'
    version     '0.9.6p1RC1'
    revision    '1' 
    #vendor      'aussielunix'
    description 'graylog2-server is the server part of an open source log management solution that stores your logs in elasticsearch.'
    section     'admin'

    java = [
      'openjdk-7-jdk', 'openjdk-7-jre', 'openjdk-7-jre-headless',
      'openjdk-6-jdk', 'openjdk-6-jre', 'openjdk-6-jre-headless'
    ]

    depends java.join(' | ')

    config_files '/etc/graylog2.conf'

    def build
        inreplace 'bin/graylog2ctl' do |s| 
            s.gsub! '../graylog2-server.jar', share('graylog2-server/graylog2-server.jar')
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

