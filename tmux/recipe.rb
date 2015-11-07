class Tmux < FPM::Cookery::Recipe
  description 'terminal multiplexer'

  name     'tmux'
  version  '2.1'
  homepage 'https://tmux.github.io/'
  source   "https://github.com/tmux/tmux/releases/download/#{version}/tmux-#{version}.tar.gz"
  sha1     '7b9a63f1d029498705e6a7bb980bc2f554d9d258'

  conflicts 'tmux'
  replaces  'tmux'

  build_depends 'libncurses5-dev', 'libevent1-dev'
  depends 'libevent-1.4-2'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
