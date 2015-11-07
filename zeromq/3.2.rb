class ZeroMQ < FPM::Cookery::Recipe
  description 'The Intelligent Transport Layer'

  name     'zeromq'
  version  '3.2.5'
  revision '1'

  homepage 'http://www.zeromq.org'
  source   "http://download.zeromq.org/zeromq-#{version}.tar.gz"
  sha256   '09653e56a466683edb2f87ee025c4de55b8740df69481b9d7da98748f0c92124'

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
