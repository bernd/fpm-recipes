# Adapted from the formula in brew2deb.

class NodeJS < FPM::Cookery::Recipe
  description 'Evented I/O for V8 JavaScript'

  name     'nodejs'
  version  '0.10.9'
  revision 0
  homepage 'http://nodejs.org/'
  source   "http://nodejs.org/dist/v#{version}/node-v#{version}.tar.gz"
  sha256   '25fb276ac6765ebb19f44d3e3775ed1c0275f874c896755d0d619226caee9c30'

  section 'interpreters'

  build_depends 'libssl-dev', 'g++', 'python'
  depends       'openssl'

  def build
    configure :prefix => prefix, :debug => true
    make
  end

  def install
    make :install, 'DESTDIR' => destdir

    # https://github.com/joyent/node/issues/2192
    prefix('lib/node_modules/npm/man/man1').mkpath
  end
end
