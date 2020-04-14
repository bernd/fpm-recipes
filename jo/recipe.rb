class Jo < FPM::Cookery::Recipe
  description 'JSON output from a shell'

  name     'jo'
  version  '1.3'
  homepage 'http://code.google.com/p/clamz/'
  source   "https://github.com/jpmens/jo/releases/download/#{version}/jo-#{version}.tar.gz"
  sha256   'de25c95671a3b392c6bcaba0b15d48eb8e2435508008c29477982d2d2f5ade64'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
