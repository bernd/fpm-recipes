class Define < FPM::Cookery::Recipe
  description 'command-line dictionary (thesaurus) app'

  name 'define'
  version '0.1.0'

  homepage 'https://github.com/Rican7/define'
  source "https://github.com/Rican7/define/releases/download/v#{version}/define_linux_amd64"
  sha256 'c48c6eacaa16081bd2531a839f1ce802f39c7a6e2e5b40d1b8cdb90b897117e4'

  def build
  end

  def install
    chmod 0555, 'define_linux_amd64'
    bin.install 'define_linux_amd64', 'define'
  end
end
