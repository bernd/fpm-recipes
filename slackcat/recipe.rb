class Slackcat < FPM::Cookery::Recipe
  description 'Pipe command output and upload files to Slack from your terminal'

  name     'slackcat'
  version  '0.7'
  revision '1'

  homepage 'http://slackcat.chat/'

  source "https://github.com/vektorlab/slackcat/releases/download/v#{version}/slackcat-#{version}-linux-#{FPM::Cookery::Facts.arch}"
  sha256 '982d3bdbde79b55224e7285990b0fcf246982b29790def68bb0d8c3bae968ca4'

  def build
  end

  def install
    bin.install "slackcat-#{version}-linux-#{FPM::Cookery::Facts.arch}", 'slackcat'
    sh "chmod +x #{bin('slackcat').to_s}"
  end
end
