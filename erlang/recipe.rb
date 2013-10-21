# Adapted from the formula in brew2deb.

class ErlangR16 < FPM::Cookery::Recipe
  description 'Concurrent, real-time, distributed functional language'

  name     'erlang-r16'
  version  '16.b.1'
  homepage 'http://www.erlang.org'
  source   'http://www.erlang.org/download/otp_src_R16B01.tar.gz'
  sha256   'da388bc07b8ebdd008f5bb6c3d2c280e358bd188b5aac3ea01e3a7436315abc0'

  section 'main'

  case platform
    when :centos, :redhat
      then
      build_depends 'ncurses-devel', 'glibc-devel', 'openssl-devel'
    when :debian, :ubuntu
      then
      build_depends 'libncurses5-dev', 'libssl-dev', 'libc6-dev-i386'
  end

  depends       'openssl'

  def build
    # Do this if building from a checkout to generate configure
    #system "./otp_build autoconf" if File.exist? "otp_build"

    configure :enable_debug => true,
            :prefix => "/mochi/opt",
            :enable_kernel_poll => true,
            :enable_threads => true,
            :enable_dynamic_ssl_lib => true,
            :enable_smp_support => true

    inline_replace 'Makefile' do |s|
      s.gsub! %r{^install\.bin:}, "install.bin:\ndisabled-install.bin:"
    end

    make 'libdir_suffix' => '/erlang-r15'
  end

  def install
    make :install, 'DESTDIR' => destdir, 'libdir_suffix' => '/erlang-r15'
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
