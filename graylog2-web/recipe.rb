class Graylog2Web < FPM::Cookery::Recipe
  homepage    'http://graylog2.org'
  source      'https://github.com/downloads/Graylog2/graylog2-web-interface/graylog2-web-interface-0.9.6p1.tar.gz'
  md5         'f7b49a5259781a5a585cf7ee406e35c6'

  name        'graylog2-web'
  version     '0.9.6p1'
  revision    '1'
  vendor      'aussielunix'
  description 'graylog2-web is the web part of an open source log management solution that stores your logs in elasticsearch.'
  arch	      'all'
  section     'admin'

  build_depends 'rubygems', 'bundler'

  depends 'ruby1.8', 'libopenssl-ruby', 'ruby', 'rubygems', 'ruby-bundler'


  pre_install 'preinst'
  post_install 'postinst'
  post_uninstall 'postrm'

  def build
    system 'bundle install --deployment  1>/dev/null'
    system 'bundle check  1>/dev/null'
    inline_replace 'config/mongoid.yml' do |s|
      s.gsub! '<%= ENV[\'MONGOID_HOST\'] %>', 'localhost'
      s.gsub! 'port: <%= ENV[\'MONGOID_PORT\'] %>', 'database: graylog2'
      s.gsub! 'username: <%= ENV[\'MONGOID_USERNAME\'] %>', ''
      s.gsub! 'password: <%= ENV[\'MONGOID_PASSWORD\'] %>', ''
      s.gsub! 'database: <%= ENV[\'MONGOID_DATABASE\'] %>', ''
    end
  end

  def install
    share('graylog2-web').install workdir('COPYING')
    share('graylog2-web').install workdir('README')
    share('graylog2-web').install Dir['*']
    share('graylog2-web').install Dir['.bundle']
  end
end
