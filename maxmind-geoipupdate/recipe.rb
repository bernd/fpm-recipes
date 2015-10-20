class MindmaxGeoip < FPM::Cookery::Recipe
  description 'The GeoIP Update program performs automatic updates of GeoIP2 and GeoIP Legacy binary databases. Currently the program only supports Linux and other Unix- like systems.'

  name     'geoipupdate'
  version  "2.0.0"
  homepage 'http://dev.maxmind.com/geoip/geoipupdate/'
  source   'https://github.com/maxmind/geoipupdate/releases/download/v2.0.0/geoipupdate-2.0.0.tar.gz'
  section  'main'

  build_depends 'libcurl4-gnutls-dev'

  maintainer 'Zane <zane.williamson@gmail.com>'

  def build
    configure :prefix => '/usr/local'
    make
  end

  def install
    make :install
  end

end
