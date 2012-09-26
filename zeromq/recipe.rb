class ZeroMQ < FPM::Cookery::Recipe
  description 'The Intelligent Transport Layer'

  name     'zeromq'
  version  '3.2.0.rc1'
  homepage 'http://www.zeromq.org'
  source   'http://download.zeromq.org/zeromq-3.2.0-rc1.tar.gz'
  sha256   '6418523f281f618b9da677b8b640c158049a4f7e6f9f391909101b242e4cc991'

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
