class Hub < FPM::Cookery::Recipe
  description 'hub helps you win at git'

  name     'hub'
  version  '2.11.2'
  revision '1'
  arch     FPM::Cookery::Facts.arch
  homepage 'http://hub.github.com/'
  source   "https://github.com/github/hub/releases/download/v#{version}/hub-linux-#{arch}-#{version}.tgz"
  sha256   '7e7a57f5323d3d7d9637cad8ea8f584d7db67e040201d6d88275910f8e235a80'

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
