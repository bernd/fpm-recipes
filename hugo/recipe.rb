class Hugo < FPM::Cookery::Recipe
  description 'Fast and Flexible Static Site Generator built with love in GoLang'

  name 'hugo'
  version '0.69.2'
  revision '1'

  homepage 'http://gohugo.io/'
  source "https://github.com/gohugoio/hugo/releases/download/v#{version}/hugo_#{version}_Linux-64bit.tar.gz"
  sha256 '167d8fb2db1728c0b24914030bab498e38d8ae1dcb01f792672b8a0085903ddf'

  def build
  end

  def install
    bin.install 'hugo'
  end
end
