# Adapted from the formula in brew2deb.

class Redis < FPM::Cookery::Recipe
  description 'A heads up display for git'

  name     'git-radar'
  version  '0.4'
  revision 1
  homepage 'https://github.com/michaeldfallen/git-radar'
  source   "https://github.com/michaeldfallen/git-radar/archive/v#{version}.tar.gz"
  sha256   'ce99215687e35797b971e609938207010cb09de69fdc4385369ded8685f82dab'
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
