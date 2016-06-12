class Hub < FPM::Cookery::Recipe
  description 'hub helps you win at git'

  name     'hub'
  version  '2.2.3'
  revision '1'
  arch     FPM::Cookery::Facts.arch
  homepage 'http://hub.github.com/'
  source   "https://github.com/github/hub/releases/download/v#{version}/hub-linux-#{arch}-#{version}.tgz"
  sha256   '54c35a459a4241b7ae4c28bcfea0ceef849dd2f8a9dd2b82ba2ba964a743e6bc'

  def build
  end

  def install
    bin.install 'bin/hub'
    man1.install 'share/man/man1/hub.1'
    etc('bash_completion.d').install 'etc/hub.bash_completion.sh', 'hub'
  end
end
