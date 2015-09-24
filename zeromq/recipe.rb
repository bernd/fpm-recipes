class ZeroMQ < FPM::Cookery::Recipe
  description 'The Intelligent Transport Layer'

  name     'zeromq'
  version  '2.1.7'
  homepage 'http://www.zeromq.org'
  source   'http://download.zeromq.org/zeromq-2.1.7.tar.gz'
  sha256   '2a1416d0a3ea55ae17d43417fd9bd193412cc9101e144bc8d3bd19fe36816e0d'
  conflicts 'libzmq1'
  replaces  'libzmq1'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
