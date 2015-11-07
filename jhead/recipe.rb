class Jhead < FPM::Cookery::Recipe
  description 'Exif Jpeg header manipulation tool'

  name     'jhead'
  version  '3.00'
  revision '1'

  homepage 'http://www.sentex.net/~mwandel/jhead/'
  source   "http://www.sentex.net/~mwandel/jhead/jhead-#{version}.tar.gz"
  sha256   '88cc01da018e242fe2e05db73f91b6288106858dd70f27506c4989a575d2895e'

  def build
    make
  end

  def install
    bin.install 'jhead'
    man1.install 'jhead.1'
  end
end
