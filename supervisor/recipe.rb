class Supervisor < FPM::Cookery::Recipe
  description 'A client/server system that allows its users to monitor and control a number of processes on UNIX-like operating systems'

  name     'supervisor'
  version  '3.1.3'
  revision '1'

  homepage 'http://www.supervisord.org/'
  source   'http://github.com/Supervisor/supervisor', :with => :git, :tag => "#{version}"

  arch     'all'
  section  'admin'

  depends        'python (>= 2.6)', 'python-medusa (>= 0.5.4)', 'python-meld3', 'python-pkg-resources (>= 0.6c7)', 'python-support (>= 0.90.0)'
  build_depends  'python-setuptools'

  config_files '/etc/supervisor/supervisord.conf',
               '/etc/init/supervisor.conf',
               '/etc/default/supervisor'

  def build
    safesystem 'python setup.py build'
  end

  def install
    safesystem 'python setup.py install --single-version-externally-managed --root=../../tmp-dest --no-compile --install-layout=deb'
    lib('python2.7/dist-packages/supervisor').install workdir('cache/supervisor/supervisor/version.txt') # kludge
    etc('supervisor').install workdir('supervisord.conf')
    etc('supervisor/conf.d').mkdir
    etc('default').install_p workdir('supervisor.default'), 'supervisor'
    etc('init').install_p workdir('supervisor.init'), 'supervisor.conf'
    var('log/supervisor').mkdir
    var('run/supervisor').mkdir
  end
end
