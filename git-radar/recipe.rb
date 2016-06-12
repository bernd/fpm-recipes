# Adapted from the formula in brew2deb.

class Redis < FPM::Cookery::Recipe
  description 'A heads up display for git'

  name     'git-radar'
  version  '0.6'
  revision '1'
  homepage 'https://github.com/michaeldfallen/git-radar'
  source   "https://github.com/michaeldfallen/git-radar/archive/v#{version}.tar.gz"
  sha256   '8a2ba434134413e16d83a6dd8d98ba5e1d3ac782a0719abc27fc6feef6ca5a82'
  arch     'all'

  def build
  end

  def install
    share('git-radar').install %w(
      fetch.sh git-radar prompt.bash prompt.zsh radar-base.sh
    )
    mkdir_p bin
    safesystem("ln -s /usr/share/git-radar/git-radar #{bin('git-radar')}")
  end
end
