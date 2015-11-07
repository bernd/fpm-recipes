class Libsodium < FPM::Cookery::Recipe
  description 'A modern and easy-to-use crypto library.'

  name     'libsodium'
  version  '1.0.6'
  revision '1'

  homepage 'https://github.com/jedisct1/libsodium'
  source   "https://github.com/jedisct1/libsodium/releases/download/#{version}/libsodium-#{version}.tar.gz"
  sha256   '940d03ea7d2caa7940e24564bf6d9f66d6edd1df1e0111ff8e3655f3b864fb59'

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
