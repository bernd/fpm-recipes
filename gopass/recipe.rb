class Gopass < FPM::Cookery::Recipe
  description 'slightly more awesome standard unix password manager for teams'

  name     'gopass'
  version  '1.4.1'
  revision '1'

  homepage 'https://github.com/justwatchcom/gopass/releases'
  source   "https://github.com/justwatchcom/gopass/releases/download/v#{version}/gopass-#{version}-linux-amd64.tar.gz"
  sha256   '6c46e9f76d760be2d709b7d3561260dd6e908cff406cf590a62ac5e6a00e16a9'

  def build
  end

  def install
    bin.install 'gopass'
    etc('bash_completion.d').install 'bash.completion', 'gopass'
    share('doc/gopass').install 'README.md'
  end
end
