class OfflineIMAP < FPM::Cookery::Recipe
  description 'IMAP/Maildir synchronization and reader support'

  name     'offlineimap'
  version  '6.6.1'
  revision '1'
  homepage 'http://offlineimap.org/'
  source   'https://github.com/OfflineIMAP/offlineimap', :with => :git, :tag => "v#{version}"

  build_depends 'python-docutils', 'asciidoc'
  depends       'libsqlite0', 'python-sqlite'

  def build
    make
    sh 'make -C docs man'

    Dir.chdir('docs') do
      sh 'gzip offlineimap.1'
      sh 'gzip offlineimapui.7'
    end
  end

  def install
    with_trueprefix do
      sh "python setup.py install --root #{destdir} --prefix #{prefix} --install-layout deb"
    end

    Dir.chdir('docs') do
      man1.install 'offlineimap.1.gz'
      man7.install 'offlineimapui.7.gz'
    end
  end
end
