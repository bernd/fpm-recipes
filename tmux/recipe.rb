class Tmux < FPM::Cookery::Recipe
  description 'terminal multiplexer'

  name     'tmux'
  version  '1.5'
  homepage 'http://tmux.sourceforge.net/'
  source   'http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.5/tmux-1.5.tar.gz'

  conflicts 'tmux'
  replaces  'tmux'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
