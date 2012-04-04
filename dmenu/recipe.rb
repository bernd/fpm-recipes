class Dmenu < FPM::Cookery::Recipe
  description 'dynamic menu for X, originally designed for dwm'

  name     'dmenu'
  version  '4.5'
  homepage 'http://tools.suckless.org/dmenu/'
  source   "http://dl.suckless.org/tools/dmenu-#{version}.tar.gz"
  sha256   '082cd698d82125ca0b3989006fb84ac4675c2a5585bf5bb8af0ea09cfb95a850'

  conflicts 'dwm-tools'
  replaces  'dwm-tools'

  def build
    make 'PREFIX' => prefix
  end

  def install
    make :install, 'PREFIX' => prefix
  end
end
