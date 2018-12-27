class Ripgrep < FPM::Cookery::Recipe
  description 'recursively searches directories for a regex pattern'

  name     'ripgrep'
  version  '0.10.0'
  revision '1'

  homepage 'https://github.com/BurntSushi/ripgrep'
  source   "https://github.com/BurntSushi/ripgrep/releases/download/#{version}/ripgrep-#{version}-x86_64-unknown-linux-musl.tar.gz"
  sha256   'c76080aa807a339b44139885d77d15ad60ab8cdd2c2fdaf345d0985625bc0f97'

  def build
  end

  def install
    bin.install 'rg'
    man1.install 'doc/rg.1'
    doc('ripgrep').install Dir['doc/*.md']
  end
end
