class Ripgrep < FPM::Cookery::Recipe
  description 'recursively searches directories for a regex pattern'

  name     'ripgrep'
  version  '12.0.1'
  revision '1'

  homepage 'https://github.com/BurntSushi/ripgrep'
  source   "https://github.com/BurntSushi/ripgrep/releases/download/#{version}/ripgrep-#{version}-x86_64-unknown-linux-musl.tar.gz"
  sha256   '2dbd6e0cef8048f26ea9f0d6b5412f117645001c5cec267b3bcd4716a64a7a7a'

  def build
  end

  def install
    bin.install 'rg'
    man1.install 'doc/rg.1'
    doc('ripgrep').install Dir['doc/*.md']
    etc('bash_completion.d').install 'complete/rg.bash', 'rg'
  end
end
