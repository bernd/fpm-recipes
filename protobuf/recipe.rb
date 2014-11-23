class Protobuf < FPM::Cookery::Recipe
  description 'language-neutral, platform-neutral, extensible mechanism for serializing structured data'

  name     'protobuf'
  version  '2.6.1'
  homepage 'https://developers.google.com/protocol-buffers/'
  source   "https://github.com/google/protobuf/releases/download/#{version}/protobuf-#{version}.tar.bz2"
  sha256   'ee445612d544d885ae240ffbcbf9267faa9f593b7b101f21d58beceb92661910'

  build_depends 'zlib1g-dev'
  depends       'zlib1g'

  conflicts 'libprotobuf-dev', 'libprotobuf-lite8', 'libprotoc-dev', 'protobuf-compiler'
  replaces  'libprotobuf-dev', 'libprotobuf-lite8', 'libprotoc-dev', 'protobuf-compiler'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
