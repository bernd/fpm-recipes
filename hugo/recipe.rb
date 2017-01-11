class Hugo < FPM::Cookery::Recipe
  description 'Fast and Flexible Static Site Generator built with love in GoLang'

  name 'hugo'
  version '0.18.1'
  revision '1'

  homepage 'http://gohugo.io/'
  source "https://github.com/spf13/hugo/releases/download/v#{version}/hugo_#{version}_Linux-64bit.tar.gz"
  sha256 'cb462f41ff9620df89f69b85ccdea48cd789490bbab7a17d9c349dae76490add'

  def build
  end

  def install
    bin.install "hugo_#{version}_linux_amd64", 'hugo'
  end
end
