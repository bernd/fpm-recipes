# Adapted from the formula in brew2deb.

class NodeJS < FPM::Cookery::Recipe
  description 'Evented I/O for V8 JavaScript'

  name     'nodejs'
  version  '0.6.7'
  revision 0
  homepage 'http://nodejs.org/'
  source   "http://nodejs.org/dist/v#{version}/node-v#{version}.tar.gz"
  sha256   'b34387449723352d2f5b7a51d8c1358c247908a5f7acd7849cac45f980246d54'

  section 'interpreters'

  build_depends 'libssl-dev', 'g++', 'python'
  depends       'openssl'

  def build
    inreplace 'wscript' do |s|
      s.gsub! '/usr/local', '/usr'
      s.gsub! '/opt/local/lib', '/usr/lib'
    end

    configure :prefix => prefix, :debug => true
    make
  end

  def install
    make :install, 'DESTDIR' => destdir

    # https://github.com/joyent/node/issues/2192
    prefix('lib/node_modules/npm/man/man1').mkpath
  end
end
