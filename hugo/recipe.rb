class Hugo < FPM::Cookery::Recipe
  description 'Fast and Flexible Static Site Generator built with love in GoLang'

  name 'hugo'
  version '0.32.4'
  revision '1'

  homepage 'http://gohugo.io/'
  source "https://github.com/spf13/hugo/releases/download/v#{version}/hugo_#{version}_Linux-64bit.tar.gz"
  sha256 '004e437e4afa7a3556019b4215767d6823435d9a4c5b6f82715b93ac93bea44f'

  def build
  end

  def install
    bin.install 'hugo'
  end
end
