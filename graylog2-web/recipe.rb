class Graylog2Web < FPM::Cookery::Recipe
    homepage    'http://graylog2.org'
    source      'https://github.com/downloads/Graylog2/graylog2-web-interface/graylog2-web-interface-0.9.6p1-RC1.tar.gz'
    md5         '1235c5ccf3d9cf2b3d92f27702bce60d'

    name        'graylog2-web'
    version     '0.9.6p1RC1'
    revision    '1'
    vendor      'bulletproof'
    description 'graylog2-web is the web part of an open source log management solution that stores your logs in elasticsearch.'
    section     'admin'

    build_depends 'rubygems', 'bundler'

    #TODO: set proper deps here including ruby etc
    depends 'ruby1.8', 'libopenssl-ruby', 'ruby', 'rubygems'


    #config_files '/etc/graylog2.conf'
    pre_install 'preinst'
    post_install 'postinst'
    post_uninstall 'postrm'

    def build
	system '/var/lib/gems/1.8/bin/bundle install 1>/dev/null'
	system '/var/lib/gems/1.8/bin/bundle package 1>/dev/null'
	system '/var/lib/gems/1.8/bin/bundle --deployment 1>/dev/null'
    end

    def install
	
        share('graylog2-web').install workdir('COPYING')
        share('graylog2-web').install workdir('README')
        share('graylog2-web').install Dir['*']
    end
end
