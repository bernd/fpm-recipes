class Hugo < FPM::Cookery::Recipe
  description 'Fast and Flexible Static Site Generator built with love in GoLang'

  name 'hugo'
  version '0.16'
  revision '1'

  homepage 'http://gohugo.io/'
  source "https://github.com/spf13/hugo/releases/download/v#{version}/hugo_#{version}_linux-64bit.tgz"
  sha256 '13e299dc45bea4fad5bdf8c2640305a5926e2acd02c3aa03b7864403e513920e'

  def build
  end

  def install
    bin.install 'hugo'
  end
end
