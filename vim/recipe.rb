class Vim < FPM::Cookery::Recipe
  description 'Vi IMproved - enhanced vi editor'

  name     'vim73'
  version  '7.3.363'
  source   'https://vim.googlecode.com/hg/', :as => 'vim.hg',:with => :hg,
                                             :rev => 'v7-3-363'
  homepage 'http://www.vim.org/'

  platforms [:debian, :ubuntu] do
    post_install  'deb-post-install'
    pre_uninstall 'deb-pre-uninstall'
  end

  # XXX Missing dependencies!

  def build
    configure '--with-x', '--disable-gpm', '--disable-nls', '--enable-gui=no',
              '--with-vim-name=vim73', '--with-ex-name=ex73',
              '--with-view-name=view73', '--enable-multibyte',
              'prefix' => prefix

    # Set VIMDIR to avoid config problems with other versions in /usr/share/vim.
    make 'VIMDIR' => '/vim73'
  end

  def install
    # Set VIMDIR to avoid config problems with other versions in /usr/share/vim.
    make :install, 'DESTDIR' => destdir, 'VIMDIR' => '/vim73'

    man1('xxd.1').rename man1('xxd73.1')
    bin('xxd').rename bin('xxd73')
  end
end
