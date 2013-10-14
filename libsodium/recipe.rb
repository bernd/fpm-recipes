class Libsodium < FPM::Cookery::Recipe
  description 'portable, cross-compilable, installable, packageable, API-compatible version of NaCl'

  name     'libsodium'
  version  '0.4.3'
  revision 0
  source   "https://github.com/jedisct1/libsodium/releases/download/#{version}/libsodium-#{version}.tar.gz"
  sha256   '599ce19ae6ace2d30aee353b931088f720713c4e1d0b2918ed46de1914fb6042'
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
