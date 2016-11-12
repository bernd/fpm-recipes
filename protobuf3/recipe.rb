class Protobuf3 < FPM::Cookery::Recipe
  description %(Protocol Buffers - Google's data interchange format)

  name 'protoc3'
  version '3.1.0'
  revision '1'

  source "https://github.com/google/protobuf/releases/download/v#{version}/protoc-#{version}-linux-x86_64.zip"
  sha256 '7c98f9e8a3d77e49a072861b7a9b18ffb22c98e37d2a80650264661bfaad5b3a'

  def build
  end

  def install
    bin.install 'bin/protoc', 'protoc3'
    chmod 0555, bin('protoc3')
  end
end
