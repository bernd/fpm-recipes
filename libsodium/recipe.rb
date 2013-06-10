class Libsodium < FPM::Cookery::Recipe
  description 'portable, cross-compilable, installable, packageable, API-compatible version of NaCl'

  name     'libsodium'
  version  '0.4.1'
  revision 0
  source   "http://download.dnscrypt.org/libsodium/releases/libsodium-#{version}.tar.gz"
  sha256   '65756c7832950401cc0e6ee0e99b165974244e749f40f33d465f56447bae8ce3'
  homepage 'https://github.com/jedisct1/libsodium'
  license  'BSD'

  section 'libs'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, :DESTDIR => destdir
  end
end
