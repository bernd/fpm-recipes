class Hub < FPM::Cookery::Recipe
  description 'hub helps you win at git'

  name     'hub'
  version  '2.7.0'
  revision '1'
  arch     FPM::Cookery::Facts.arch
  homepage 'http://hub.github.com/'
  source   "https://github.com/github/hub/releases/download/v#{version}/hub-linux-#{arch}-#{version}.tgz"
  sha256   '007a5aca10fff7fa4db0f1e6231ab9ac508c5f9bc812f7985c07fcabfbe58dca'

  def build
  end

  def install
    bin.install 'bin/hub'
    Dir['share/man/man1/*.1'].each do |manfile|
      man1.install manfile
    end
    etc('bash_completion.d').install 'etc/hub.bash_completion.sh', 'hub'
  end
end
