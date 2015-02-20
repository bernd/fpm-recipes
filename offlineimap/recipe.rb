class OfflineIMAP < FPM::Cookery::Recipe
  description 'IMAP/Maildir synchronization and reader support'

  name     'offlineimap'
  version  '6.5.7-rc2'
  revision 4
  homepage 'http://offlineimap.org/'
  source   'https://github.com/OfflineIMAP/offlineimap', :with => :git, :tag => "v#{version}"

  build_depends 'python-docutils'
  depends       'libsqlite0', 'python-sqlite'

  def build
    # Looks like they forgot to bump the version for 6.5.6.
    inline_replace 'offlineimap/__init__.py' do |s|
      s.gsub! %(__version__     = "6.5.5"), %(__version__     = "#{version}")
    end

    make
    safesystem 'make -C docs man'
    gzip_path = find_executable 'gzip'
    safesystem gzip_path, 'offlineimap.1'
  end

  def install
    with_trueprefix do
      safesystem "python setup.py install --root #{destdir} --prefix #{prefix} --install-layout deb"
    end

    man1.install 'offlineimap.1.gz'
  end
end
