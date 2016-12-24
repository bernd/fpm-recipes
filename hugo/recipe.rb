class Hugo < FPM::Cookery::Recipe
  description 'Fast and Flexible Static Site Generator built with love in GoLang'

  name 'hugo'
  version '0.18'
  revision '1'

  homepage 'http://gohugo.io/'
  source "https://github.com/spf13/hugo/releases/download/v#{version}/hugo_#{version}_Linux-64bit.tar.gz"
  sha256 '9993f091dd3614401627a926571fb9f057f26c6d584581d79fc6c43fca436640'

  def build
  end

  def install
    bin.install "hugo_#{version}_linux_amd64", 'hugo'
  end
end
