class Op < FPM::Cookery::Recipe
  description '1password CLI'

  homepage 'https://app-updates.agilebits.com/product_history/CLI'

  name     'op'
  version  '0.5.1'
  revision '1'

  source "https://cache.agilebits.com/dist/1P/op/pkg/v#{version}/op_linux_amd64_v#{version}.zip"
  sha256 'fb7312e9323ee286a8265b62b9ca7f663368b7f41e7d2f49e96927d9620ed7a3'

  def build
  end

  def install
    bin.install 'op'
  end
end
