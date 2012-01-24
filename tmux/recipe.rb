class Tmux < FPM::Cookery::Recipe
  description 'terminal multiplexer'

  name     'tmux'
  version  '1.6'
  homepage 'http://tmux.sourceforge.net/'
  source   "http://downloads.sourceforge.net/project/tmux/tmux/tmux-#{version}/tmux-#{version}.tar.gz"
  sha1     '8756f6bcecb18102b87e5d6f5952ba2541f68ed3'

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
