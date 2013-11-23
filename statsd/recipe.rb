class Statsd < FPM::Cookery::Recipe
  description 'Simple daemon for easy stats aggregation'

  name     'statsd'
  version  '0.6.0'
  revision 0
  license  'MIT'
  homepage 'https://github.com/etsy/statsd'
  source   'https://github.com/etsy/statsd.git', :with => :git, :tag => "v#{version}"

  arch     'all'

  build_depends 'nodejs'
  depends       'nodejs (>= 0.10.22)'

  post_install   'post-install'
  post_uninstall 'post-uninstall'

  config_files '/etc/statsd/config.js'

  def build
    # Include influxdb backend.
    safesystem('npm install statsd-influxdb-backend')
  end

  def install
    share('statsd').install Dir['*']
    etc('statsd').install workdir('statsd.config.js'), 'config.js'
    etc('init').install workdir('statsd.upstart'), 'statsd.conf'
  end
end
