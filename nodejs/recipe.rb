# Adapted from the formula in brew2deb.

class NodeJS < FPM::Cookery::Recipe
  description 'Evented I/O for V8 JavaScript'

  name     'nodejs'
  version  '0.4.12'
  homepage 'http://nodejs.org/'
  source   "http://nodejs.org/dist/node-v#{version}.tar.gz"
  sha256   'c01af05b933ad4d2ca39f63cac057f54f032a4d83cff8711e42650ccee24fce4'

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
  end
end
