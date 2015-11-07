class ZeroMQ < FPM::Cookery::Recipe
  description 'The Intelligent Transport Layer'

  name     'zeromq'
  version  '4.1.3'
  revision '1'

  homepage 'http://www.zeromq.org'
  source   "http://download.zeromq.org/zeromq-#{version}.tar.gz"
  sha256   '61b31c830db377777e417235a24d3660a4bcc3f40d303ee58df082fcd68bf411'

  conflicts 'libzmq1'
  replaces  'libzmq1'

  build_depends 'pkg-config', 'libsodium'

  def build
    patch workdir('patches/libsodium-1.0.6.diff')

    configure :prefix => prefix

    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
