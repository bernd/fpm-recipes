class Udict < FPM::Cookery::Recipe
  description 'A command line urban dictionary'

  homepage 'https://github.com/genuinetools/udict'

  name     'udict'
  version  '0.5.3'
  revision '1'

  source "https://github.com/genuinetools/udict/releases/download/v#{version}/udict-linux-amd64"
  sha256 '4085ce5cceefe5f791c4018bc961d422a9bcf7f6baa96d6600fb66e19bf8ad68'

  def build
  end

  def install
    chmod 0555, 'udict-linux-amd64'
    bin.install 'udict-linux-amd64', 'udict'
  end
end
