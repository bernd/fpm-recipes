class Hub < FPM::Cookery::Recipe
  description 'hub helps you win at git'

  name     'hub'
  version  '2.2.9'
  revision '1'
  arch     FPM::Cookery::Facts.arch
  homepage 'http://hub.github.com/'
  source   "https://github.com/github/hub/releases/download/v#{version}/hub-linux-#{arch}-#{version}.tgz"
  sha256   '5867647071007add582f911867fb4973354c51690ac20aecb2e73be7440875a3'

  def build
  end

  def install
    bin.install 'bin/hub'
    man1.install 'share/man/man1/hub.1'
    etc('bash_completion.d').install 'etc/hub.bash_completion.sh', 'hub'
  end
end
