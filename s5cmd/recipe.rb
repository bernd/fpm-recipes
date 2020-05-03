class Godeb < FPM::Cookery::Recipe
  description 'Parallel S3 and local filesystem execution tool'

  name     's5cmd'
  version  '1.0.0'
  revision '1'

  homepage 'https://github.com/peak/s5cmd'
  source "https://github.com/peak/s5cmd/releases/download/v#{version}/s5cmd_#{version}_Linux-64bit.tar.gz"
  sha256 'a56eab6493fa6613d525e7329dc15ba161cd233708f3a0b168829934731c60f2'

  def build
  end

  def install
    bin.install 's5cmd'
    doc('s5cmd').install Dir['*.md']
    doc('s5cmd').install 'LICENSE'
  end
end
