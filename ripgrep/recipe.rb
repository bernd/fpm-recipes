class Ripgrep < FPM::Cookery::Recipe
  description 'combines the usability of The Silver Searcher with the raw speed of grep'

  name     'ripgrep'
  version  '0.1.16'
  revision '1'

  homepage 'https://github.com/BurntSushi/ripgrep/releases'
  source   "https://github.com/BurntSushi/ripgrep/releases/download/#{version}/ripgrep-#{version}-x86_64-unknown-linux-musl.tar.gz"
  sha256   'ce9181ed2fd7676ff3c3afbb97431a092178477e7802410145aa5331ca0cca5b'

  def build
  end

  def install
    bin.install 'rg'
    man1.install 'rg.1'
  end
end
