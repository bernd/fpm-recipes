class Curlie < FPM::Cookery::Recipe
  description 'The power of curl, the ease of use of httpie.'

  name 'curlie'
  version '1.2.0'
  revision '1'

  homepage 'https://curlie.io/'
  source "https://github.com/rs/curlie/releases/download/v#{version}/curlie_#{version}_linux_amd64.tar.gz"
  sha256 'ff27eaaa5b3540e0924a4096c55ec70001f46564abaa005ac92c48a94a62fe32'

  def build
  end

  def install
    bin.install 'curlie'
  end
end
