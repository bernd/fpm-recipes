class Ripgrep < FPM::Cookery::Recipe
  description 'combines the usability of The Silver Searcher with the raw speed of grep'

  name     'ripgrep'
  version  '0.4.0'
  revision '1'

  homepage 'https://github.com/BurntSushi/ripgrep/releases'
  source   "https://github.com/BurntSushi/ripgrep/releases/download/#{version}/ripgrep-#{version}-x86_64-unknown-linux-musl.tar.gz"
  sha256   'fe99ba104f3b28ed15d0c83a30ef0b2e6286a27710f88fff77c108873f181c3b'

  def build
  end

  def install
    bin.install 'rg'
    man1.install 'rg.1'
  end
end
