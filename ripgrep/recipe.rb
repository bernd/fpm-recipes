class Ripgrep < FPM::Cookery::Recipe
  description 'combines the usability of The Silver Searcher with the raw speed of grep'

  name     'ripgrep'
  version  '0.3.2'
  revision '1'

  homepage 'https://github.com/BurntSushi/ripgrep/releases'
  source   "https://github.com/BurntSushi/ripgrep/releases/download/#{version}/ripgrep-#{version}-x86_64-unknown-linux-musl.tar.gz"
  sha256   '0f81f318e0fae816565d3490b99d27b780fb54ff3836d4fbbaa524a7321a00ca'

  def build
  end

  def install
    bin.install 'rg'
    man1.install 'rg.1'
  end
end
