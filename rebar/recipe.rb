class Rebar < FPM::Cookery::Recipe
  description 'A sophisticated build-tool for Erlang projects'

  name     'rebar'
  version  '9872873'
  homepage 'https://github.com/basho/rebar'
  source   'https://github.com/basho/rebar.git', :with => :git, :sha => '9872873'

  build_depends 'erlang-dev', 'erlang-src'
  depends       'erlang-base'

  def build
    safesystem './bootstrap'
  end

  def install
    bin.install 'rebar'
    chmod 0555, bin('rebar')
  end
end
