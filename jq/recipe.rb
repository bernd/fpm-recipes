class Jq < FPM::Cookery::Recipe
  description 'a lightweight and flexible command-line JSON processor'

  name     'jq'
  version  '1.5'
  revision '1'
  homepage 'http://stedolan.github.io/jq/'
  source   'https://github.com/stedolan/jq', :with => :git, :tag => "jq-#{version}"

  build_depends 'autoconf', 'libtool'

  def build
    sh 'autoreconf -i'
    configure
    make
  end

  def install
    bin.install 'jq'
    man1.install 'jq.1'
  end
end
