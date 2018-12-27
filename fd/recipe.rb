class Fd < FPM::Cookery::Recipe
  description 'A simple, fast and user-friendly alternative to find'

  name     'fd'
  version  '7.2.0'
  revision '1'

  homepage 'https://github.com/sharkdp/fd'
  source   "https://github.com/sharkdp/fd/releases/download/v#{version}/fd-v#{version}-x86_64-unknown-linux-musl.tar.gz"
  sha256   '63ba7122ad37a3df48a0faff0b33d249694c7e8c2c8cd1f3af5a5fc5b7b74a09'

  def build
  end

  def install
    bin.install 'fd'
    etc('bash_completion.d').install 'autocomplete/fd.bash-completion', 'fd'
  end
end
