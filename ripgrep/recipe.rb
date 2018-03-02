class Ripgrep < FPM::Cookery::Recipe
  description 'recursively searches directories for a regex pattern'

  name     'ripgrep'
  version  '0.8.1'
  revision '1'

  homepage 'https://github.com/BurntSushi/ripgrep'
  source   "https://github.com/BurntSushi/ripgrep/releases/download/#{version}/ripgrep-#{version}-x86_64-unknown-linux-musl.tar.gz"
  sha256   '08b1aa1440a23a88c94cff41a860340ecf38e9108817aff30ff778c00c63eb76'

  def build
  end

  def install
    bin.install 'rg'
    man1.install 'doc/rg.1'
    doc('ripgrep').install Dir['doc/*.md']
  end
end
