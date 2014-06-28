class Golang < FPM::Cookery::Recipe
  description 'golang'

  name 'go'
  version '1.3'
  homepage 'http://golang.org/'
  source "http://golang.org/dl/go#{version}.linux-amd64.tar.gz"
  sha1 'b6b154933039987056ac307e20c25fa508a06ba6'

  config_files '/etc/profile.d/go.sh'

  conflicts 'golang', 'golang-go', 'golang-src', 'golang-doc'
  replaces 'golang', 'golang-go', 'golang-src', 'golang-doc'

  def build
  end

  def install
    mkdir_p share
    cp_r builddir('go'), share('go')

    etc('profile.d').install workdir('go.profile'), 'go.sh'
  end
end
