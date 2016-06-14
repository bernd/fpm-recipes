class Libsodium < FPM::Cookery::Recipe
  description 'A modern and easy-to-use crypto library.'

  name     'libsodium'
  version  '1.0.9'
  revision '1'

  homepage 'https://download.libsodium.org/doc/'
  source   "https://download.libsodium.org/libsodium/releases/libsodium-#{version}.tar.gz"
  sha256   '611418db78c36b2e20e50363d30e9c002a98dea9322f305b5bde56a26cdfe756'

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
