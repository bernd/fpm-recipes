class Glow < FPM::Cookery::Recipe
  description 'Render markdown on the CLI, with pizzazz!'

  name     'glow'
  version  '0.2.0'
  revision '1'

  homepage 'https://github.com/charmbracelet/glow'
  source   "https://github.com/charmbracelet/glow/releases/download/v#{version}/glow_#{version}_linux_x86_64.tar.gz"
  sha256   'ea3b158c1c3f3f9ce63a701817ffc9023bbcf2c5375f21a5890ddda7d57554c5'

  def build
  end

  def install
    bin.install 'glow'
  end
end
