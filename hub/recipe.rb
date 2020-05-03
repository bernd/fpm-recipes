class Hub < FPM::Cookery::Recipe
  description 'hub helps you win at git'

  name     'hub'
  version  '2.14.2'
  revision '1'
  arch     FPM::Cookery::Facts.arch
  homepage 'http://hub.github.com/'
  source   "https://github.com/github/hub/releases/download/v#{version}/hub-linux-#{arch}-#{version}.tgz"
  sha256   '74d95fdfb3c78c8af4e2025b04b916ad905ab99a361778500d58269847c7922d'

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
