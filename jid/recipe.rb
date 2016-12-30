class Jid < FPM::Cookery::Recipe
  description 'JSON incremental digger'

  name     'jid'
  version  '0.6.3'
  revision '1'

  homepage 'https://github.com/simeji/jid'
  source   "https://github.com/simeji/jid/releases/download/#{version}/jid_linux_amd64.zip"
  sha256   '3519711e65c896edfdfbb65a0117af4badc24cb7d02a2584d9d1470e81ab4136'

  def build
  end

  def install
    bin.install 'jid_linux_amd64', 'jid'
  end
end
