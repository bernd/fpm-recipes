class Wrk < FPM::Cookery::Recipe
  description 'Modern HTTP benchmarking tool'

  name     'wrk'
  version  '3.1.0'
  homepage 'https://github.com/wg/wrk'
  source   'https://github.com/wg/wrk', :with => :git, :tag => version

  build_depends 'libssl-dev'
  depends       'libssl1.0.0'

  def build
    make
  end

  def install
    bin.install 'wrk'
    share('wrk/scripts').install Dir['scripts/*']
    share('doc/wrk').install %w(README NOTICE LICENSE)
  end
end
