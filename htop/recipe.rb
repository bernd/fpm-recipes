class Htop < FPM::Cookery::Recipe
  description 'interactive process viewer'

  name    'htop'
  version '2.2.0'

  homepage 'http://hisham.hm/htop/'

  source   "http://hisham.hm/htop/releases/#{version}/htop-#{version}.tar.gz"
  sha256   'd9d6826f10ce3887950d709b53ee1d8c1849a70fa38e91d5896ad8cbc6ba3c57'

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
