class Op < FPM::Cookery::Recipe
  description '1password CLI'

  homepage 'https://app-updates.agilebits.com/product_history/CLI'

  name     'op'
  version  '0.8.0'
  revision '1'

  source "https://cache.agilebits.com/dist/1P/op/pkg/v#{version}/op_linux_amd64_v#{version}.zip"
  sha256 '29b70379db8c4787e491ab127422acb183267916b989eee81631e08b10742c0a'

  def build
  end

  def install
    bin.install 'op'
  end
end
