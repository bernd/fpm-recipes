class Hugo < FPM::Cookery::Recipe
  description 'Fast and Flexible Static Site Generator built with love in GoLang'

  name 'hugo'
  version '0.20.1'
  revision '1'

  homepage 'http://gohugo.io/'
  source "https://github.com/spf13/hugo/releases/download/v#{version}/hugo_#{version}_Linux-64bit.tar.gz"
  sha256 '02cc04e30da6ba2dbf7ddee1a1778e8a0e6adf3cbab074a224ba8d5d472049d1'

  def build
  end

  def install
    bin.install "hugo_#{version}_linux_amd64", 'hugo'
  end
end
