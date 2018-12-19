class JL < FPM::Cookery::Recipe
  description 'JSON Logs, a development tool for working with structured JSON logging'

  homepage 'https://github.com/koenbollen/jl'

  name 'jl'
  version '1.1.1'
  revision '1'

  source "https://github.com/koenbollen/jl/releases/download/v#{version}/jl_linux_amd64"
  sha256 '04f5e010b20ec0f035cba2c25a3e0e04e2b7fb4cf0b92551f06f3a9d75c1c9f1'

  def build
  end

  def install
    chmod 0555, 'jl_linux_amd64'
    bin.install 'jl_linux_amd64', 'jl'
  end
end
