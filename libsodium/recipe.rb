class Libsodium < FPM::Cookery::Recipe
  description 'A modern and easy-to-use crypto library.'

  name     'libsodium'
  version  '1.0.18'
  revision '1'

  homepage 'https://download.libsodium.org/doc/'
  source   "https://download.libsodium.org/libsodium/releases/libsodium-#{version}.tar.gz"
  sha256   '6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1'

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
