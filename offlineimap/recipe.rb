class OfflineIMAP < FPM::Cookery::Recipe
  description 'IMAP/Maildir synchronization and reader support'

  name     'offlineimap'
  version  '7.3.2'
  revision '1'
  homepage 'http://offlineimap.org/'
  source   "http://www.offlineimap.org/uploads/offlineimap-v#{version}.tar.gz"
  sha256   '6720a1da5d38fb6e0f2b3c27bce74fce0bf714b5c70d2f0f0bac654f4ba29423'

  docker true

  build_depends 'python-pip', 'python-docutils', 'python-setuptools', 'asciidoc', 'xmlto'

  def build
    # Installing gssapi fail so we just ignore it (not needed)
    sh 'grep -v -e "^#" requirements.txt -e gssapi | xargs -rt  pip2 install'
    sh 'make -C docs man'

    Dir.chdir('docs') do
      sh 'gzip offlineimap.1'
      sh 'gzip offlineimapui.7'
    end
  end

  def install
    with_trueprefix do
      # Bundle rfc6555 runtime dependency in the package because there is no
      # package in older Debian/Ubuntu
      sh "pip2 install --ignore-installed --root #{destdir} --prefix #{prefix} --install-option='--install-layout=deb' rfc6555"
      sh "python2 setup.py install --root #{destdir} --prefix #{prefix} --install-layout deb"
    end

    Dir.chdir('docs') do
      man1.install 'offlineimap.1.gz'
      man7.install 'offlineimapui.7.gz'
    end
  end
end
