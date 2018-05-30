class Hub < FPM::Cookery::Recipe
  description 'hub helps you win at git'

  name     'hub'
  version  '2.3.0'
  revision '1'
  arch     FPM::Cookery::Facts.arch
  homepage 'http://hub.github.com/'
  source   "https://github.com/github/hub/releases/download/v#{version}/hub-linux-#{arch}-#{version}.tgz"
  sha256   '45b50fc52cf203dc16e4866217c8d0ca70b5f78668b4218e6697b118bcfce490'

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
