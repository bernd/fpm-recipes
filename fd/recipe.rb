class Fd < FPM::Cookery::Recipe
  description 'A simple, fast and user-friendly alternative to find'

  name     'fd'
  version  '4.0.0'
  revision '1'

  homepage 'https://github.com/sharkdp/fd'
  source   "https://github.com/sharkdp/fd/releases/download/v#{version}/fd-v#{version}-x86_64-linux.tar.gz"
  sha256   '7481bd9650005d5095be907767f5d6278737348448cb07b7d625d314113cf737'

  def build
  end

  def install
    bin.install 'fd'
    etc('bash_completion.d').install 'fd.bash-completion', 'fd'
  end
end
