class Ripgrep < FPM::Cookery::Recipe
  description 'recursively searches directories for a regex pattern'

  name     'ripgrep'
  version  '0.8.0'
  revision '1'

  homepage 'https://github.com/BurntSushi/ripgrep'
  source   "https://github.com/BurntSushi/ripgrep/releases/download/#{version}/ripgrep-#{version}-x86_64-unknown-linux-musl.tar.gz"
  sha256   '621f2f16f65203aa37e7c10ecfb22384c4c01e70ebbd30a13c0d6944ffc6e59e'

  def build
  end

  def install
    bin.install 'rg'
    man1.install 'doc/rg.1'
    doc('ripgrep').install Dir['doc/*.md']
  end
end
