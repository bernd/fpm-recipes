class Ripgrep < FPM::Cookery::Recipe
  description 'recursively searches directories for a regex pattern'

  name     'ripgrep'
  version  '11.0.1'
  revision '1'

  homepage 'https://github.com/BurntSushi/ripgrep'
  source   "https://github.com/BurntSushi/ripgrep/releases/download/#{version}/ripgrep-#{version}-x86_64-unknown-linux-musl.tar.gz"
  sha256   'ce74cabac9b39b1ad55837ec01e2c670fa7e965772ac2647b209e31ead19008c'

  def build
  end

  def install
    bin.install 'rg'
    man1.install 'doc/rg.1'
    doc('ripgrep').install Dir['doc/*.md']
  end
end
