class Beanstalkd < FPM::Cookery::Recipe
  description 'A simple, fast work queue'

  name     'beanstalkd'
  version  '1.10'
  homepage 'http://kr.github.com/beanstalkd/'
  source   'http://github.com/kr/beanstalkd', :with => :git, :tag => "v#{version}"

  section      'database'
  conflicts    'beanstalkd'
  config_files '/etc/default/beanstalkd'

  post_install   'post-install'
  post_uninstall 'post-uninstall'

  def build
    make
  end

  def install
    bin.install 'beanstalkd'
    man1.install 'doc/beanstalkd.1'

    share('doc/beanstalkd').install 'doc/protocol.txt'

    etc('init').install_p workdir('beanstalkd.upstart'), 'beanstalkd.conf'
    etc('default').install_p workdir('beanstalkd.default'), 'beanstalkd'
  end
end
