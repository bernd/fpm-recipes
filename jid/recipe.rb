class Jid < FPM::Cookery::Recipe
  description 'JSON incremental digger'

  name     'jid'
  version  '0.7.2'
  revision '1'

  homepage 'https://github.com/simeji/jid'
  source   "https://github.com/simeji/jid/releases/download/#{version}/jid_linux_amd64.zip"
  sha256   '57d9e6cb6dcd052d7ffcfddd7bc88fd5a07351a9bdf0575d3355a9921153e177'

  def build
  end

  def install
    bin.install 'jid_linux_amd64', 'jid'
  end
end
