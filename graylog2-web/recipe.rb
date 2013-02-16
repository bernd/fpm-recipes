class Graylog2WebPre < FPM::Cookery::Recipe
  homepage    'http://graylog2.org'
  name        'graylog2-web'
  version     '0.10.1'
  source      "http://download.graylog2.org/#{name}-interface/#{name}-interface-#{version}.tar.gz"
  md5         '5b54ae9279ce97ae7551937674b6cad8'

  revision    '1'
  vendor      'aussielunix'
  maintainer  'Mick Pollard <aussielunix@gmail.com>'
  license     'GPL-3'

  description 'graylog2-web is the web part of an open source log management solution that stores your logs in elasticsearch.'
  arch	      'amd64'
  section     'admin'

  depends 'ruby1.9.3'


  pre_install 'preinst'
  post_install 'postinst'
  post_uninstall 'postrm'

  def build
    system 'bundle package'
    system 'bundle install --path vendor/bundle 1>/dev/null'
    system 'bundle check --path vendor/bundle 1>/dev/null'
    system "patch -u vendor/bundle/ruby/1.9.1/gems/graylog2-declarative_authorization-0.5.2//lib/declarative_authorization/reader.rb #{workdir}/declarative_authorization-patch.p0"
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
    share('graylog2-web').install Dir['vendor']
    share('graylog2-web').install Dir['.bundle']
  end
end
