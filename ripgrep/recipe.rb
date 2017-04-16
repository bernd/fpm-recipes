class Ripgrep < FPM::Cookery::Recipe
  description 'combines the usability of The Silver Searcher with the raw speed of grep'

  name     'ripgrep'
  version  '0.5.1'
  revision '1'

  homepage 'https://github.com/BurntSushi/ripgrep/releases'
  source   "https://github.com/BurntSushi/ripgrep/releases/download/#{version}/ripgrep-#{version}-x86_64-unknown-linux-musl.tar.gz"
  sha256   '4c20367910a7556524d8c946a7de1b82d103baaafc83edc97578a18063375d78'

  def build
  end

  def install
    bin.install 'rg'
    man1.install 'rg.1'
  end
end
