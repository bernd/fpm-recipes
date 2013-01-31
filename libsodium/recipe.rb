class Libsodium < FPM::Cookery::Recipe
  description 'portable, cross-compilable, installable, packageable, API-compatible version of NaCl'

  name     'libsodium'
  version  '0.2'
  revision 0
  source   'http://download.dnscrypt.org/libsodium/releases/libsodium-0.2.tar.gz'
  sha256   'e99a6b69adc080a5acf6b8a49fdc74b61d6f3579b590e85c93446a8325dde100'
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
