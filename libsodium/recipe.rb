class Libsodium < FPM::Cookery::Recipe
  description 'A modern and easy-to-use crypto library.'

  name     'libsodium'
  version  '1.0.16'
  revision '1'

  homepage 'https://download.libsodium.org/doc/'
  source   "https://download.libsodium.org/libsodium/releases/libsodium-#{version}.tar.gz"
  sha256   'eeadc7e1e1bcef09680fb4837d448fbdf57224978f865ac1c16745868fbd0533'

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
