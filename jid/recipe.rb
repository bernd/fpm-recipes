class Jid < FPM::Cookery::Recipe
  description 'JSON incremental digger'

  name     'jid'
  version  '0.7.6'
  revision '1'

  homepage 'https://github.com/simeji/jid'
  source   "https://github.com/simeji/jid/releases/download/v#{version}/jid_linux_amd64.zip"
  sha256   'b5706cda44bc76c5db8a1e7956d25ef2e25bf618a7b03e1d98e8f4fc2e2f393a'

  def build
  end

  def install
    bin.install 'jid'
  end
end
