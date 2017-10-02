class Gopass < FPM::Cookery::Recipe
  description 'slightly more awesome standard unix password manager for teams'

  name     'gopass'
  version  '1.4.0-rc3'
  revision '1'

  homepage 'https://github.com/justwatchcom/gopass/releases'
  source   "https://github.com/justwatchcom/gopass/releases/download/v#{version}/gopass-#{version}-linux-amd64.tar.gz"
  sha256   'ed233b3d2773dc7b1839f6b7a0152692019e9370bbfb9b95ed50b7590f187097'

  def build
  end

  def install
    bin.install 'gopass'
    etc('bash_completion.d').install 'bash.completion', 'gopass'
    share('doc/gopass').install 'README.md'
  end
end
