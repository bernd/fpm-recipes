class Yj < FPM::Cookery::Recipe
  description 'CLI - Convert YAML <=> TOML <=> JSON <=> HCL'

  name     'yj'
  version  '4.0.0'
  revision '1'
  homepage 'https://github.com/sclevine/yj'
  source   "https://github.com/sclevine/yj/releases/download/v#{version}/yj-linux"
  sha256   '0019875f3f0aa1ea14a0969ce8557789e95fe0307fa1d25ef29ed70ad9874438'

  def build
  end

  def install
    chmod 0555, 'yj-linux'
    bin.install 'yj-linux', 'yj'
  end
end
