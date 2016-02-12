class Htop < FPM::Cookery::Recipe
  description 'interactive process viewer'

  name    'htop'
  version '2.0.0'

  homepage 'http://hisham.hm/htop/'

  source   "http://hisham.hm/htop/releases/#{version}/htop-#{version}.tar.gz"
  sha256   'd15ca2a0abd6d91d6d17fd685043929cfe7aa91199a9f4b3ebbb370a2c2424b5'

  build_depends 'libncursesw5-dev'
  depends 'libncursesw5'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
