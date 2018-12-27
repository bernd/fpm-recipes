class Hub < FPM::Cookery::Recipe
  description 'hub helps you win at git'

  name     'hub'
  version  '2.6.1'
  revision '1'
  arch     FPM::Cookery::Facts.arch
  homepage 'http://hub.github.com/'
  source   "https://github.com/github/hub/releases/download/v#{version}/hub-linux-#{arch}-#{version}.tgz"
  sha256   'd6d8ee64484a935b314eb4816f50e9faad3b9124f86cdba486d8130bc5cbffc7'

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
