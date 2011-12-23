# Adapted from the formula in brew2deb.

class ErlangR14 < FPM::Cookery::Recipe
  description 'Concurrent, real-time, distributed functional language'

  name     'erlang-r14'
  version  '1:14.b.4'
  homepage 'http://www.erlang.org'
  source   'http://www.erlang.org/download/otp_src_R14B04.tar.gz'
  sha256   '099b35910e635b9148ac90f70fd9dd592920ed02406eb26c349efd8d1e959b6e'

  section 'main'
  build_depends 'libncurses5-dev', 'libssl-dev', 'libc6-dev-i386'
  depends       'openssl'

  def build
    # Do this if building from a checkout to generate configure
    #system "./otp_build autoconf" if File.exist? "otp_build"

    configure :enable_debug => true,
            :prefix => prefix,
            :enable_kernel_poll => true,
            :enable_treads => true,
            :enable_dynamic_ssl_lib => true,
            :enable_smp_support => true

    inline_replace 'Makefile' do |s|
      s.gsub! %r{^install\.bin:}, "install.bin:\ndisabled-install.bin:"
    end

    make 'libdir_suffix' => '/erlang-r14'
  end

  def install
    make :install, 'DESTDIR' => destdir, 'libdir_suffix' => '/erlang-r14'
  end

  def test
    `#{bin}/erl -noshell -eval 'crypto:start().' -s init stop`

    # This test takes some time to run, but per bug #120 should finish in
    # "less than 20 minutes". It takes a few minutes on a Mac Pro (2009).
    if ARGV.include? "--time"
      `#{bin}/dialyzer --build_plt -r #{lib}/erlang/lib/kernel-2.14.1/ebin/`
    end
  end
end
