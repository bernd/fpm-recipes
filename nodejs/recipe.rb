# Adapted from the formula in brew2deb.

class NodeJS < FPM::Cookery::Recipe
  description 'Evented I/O for V8 JavaScript'

  name     'nodejs'
  version  '0.6.1'
  homepage 'http://nodejs.org/'
  source   "http://nodejs.org/dist/v#{version}/node-v#{version}.tar.gz"
  sha256   'b161050ed8cdb2d45f601181d146821e5535a8fcbf5978b2ff064e5476a8e606'

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
