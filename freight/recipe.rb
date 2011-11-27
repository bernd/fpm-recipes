class Freight < FPM::Cookery::Recipe
  description 'A modern take on the Debian archive'

  name     'freight'
  version  '0.1.1'
  source   'https://github.com/rcrowley/freight.git', :with => :git, :tag => 'v0.1.1'
  homepage 'https://github.com/rcrowley/freight'

  def build
  end

  def install
    make :install, 'prefix' => '/usr', 'sysconfdir' => '/etc', 'DESTDIR' => destdir
  end
end
