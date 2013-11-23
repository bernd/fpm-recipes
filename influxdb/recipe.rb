class InfluxDB < FPM::Cookery::Recipe
  description 'Scalable datastore for metrics, events, and real-time analytics'

  name     'influxdb'
  version  '0.3.0'
  revision 0
  homepage 'http://influxdb.org/'
  source   'https://github.com/influxdb/influxdb', :with => :git, :tag => "v#{version}"

  section 'databases'

  build_depends 'go', 'build-essential', 'mercurial', 'bzr',
                'protobuf-compiler', 'bison', 'flex'

  post_install   'post-install'
  post_uninstall 'post-uninstall'

  config_files '/etc/influxdb/config.json'

  def build
    inline_replace 'exports.sh' do |s|
      d = Dir.pwd
      s.gsub! 'snappy_dir=/tmp/snappychronosdb', "snappy_dir=/#{d}/__build/snappychronosdb"
      s.gsub! 'leveldb_dir=/tmp/leveldbchronosdb', "leveldb_dir=/#{d}/__build/leveldbchronosdb"
    end
    safesystem('bash ./build.sh')
  end

  def install
    sbin.install 'server', 'influxdb'
    etc('influxdb').install workdir('config.json')
    etc('init').install workdir('influxdb.upstart'), 'influxdb.conf'
    share('influxdb').install 'admin'
  end
end
