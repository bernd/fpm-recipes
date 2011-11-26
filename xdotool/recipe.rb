class Xdotool < FPM::Cookery::Recipe
  description 'fake keyboard/mouse input, window management, and more'

  name     'xdotool'
  version  '1:2.20110530.1'
  source   "http://semicomplete.googlecode.com/files/xdotool-2.20110530.1.tar.gz"
  sha256   'e7b42c8b1d391970e1c1009b256033f30e57d8e0a2a3de229fd61ecfc27baf67'
  homepage 'http://www.semicomplete.com/projects/xdotool/'

  build_depends 'libx11-dev', 'libxtst-dev'
  depends       'libx11-6', 'libxtst6'

  def build
    make
  end

  def install
    with_trueprefix do
      ENV['PREFIX'] = prefix
    end

    # Avoid post-install.
    make 'pre-install', 'DESTDIR' => destdir
    make 'installlib', 'DESTDIR' => destdir
    make 'installprog', 'DESTDIR' => destdir
    make 'installman', 'DESTDIR' => destdir
    make 'installheader', 'DESTDIR' => destdir
  end
end
