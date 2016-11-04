class Hugo < FPM::Cookery::Recipe
  description 'Fast and Flexible Static Site Generator built with love in GoLang'

  name 'hugo'
  version '0.17'
  revision '1'

  homepage 'http://gohugo.io/'
  source "https://github.com/spf13/hugo/releases/download/v#{version}/hugo_#{version}_Linux-64bit.tar.gz"
  sha256 'f1467e204cc469b9ca6f17c0dc4da4a620643b6d9a50cb7dce2508aaf8fbc1ea'

  def build
  end

  def install
    bin.install "hugo_#{version}_linux_amd64", 'hugo'
  end
end
