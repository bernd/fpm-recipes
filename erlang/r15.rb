# Adapted from the formula in brew2deb.

class ErlangR15 < FPM::Cookery::Recipe
  description 'Concurrent, real-time, distributed functional language'

  name     'erlang-r15'
  version  '1:15.b.0'
  homepage 'http://www.erlang.org'
  source   'http://www.erlang.org/download/otp_src_R15B.tar.gz'
  sha256   '5bc34fc34fc890f84bae7ff1f7c81fbec2c9aa28a0ef51a57d7a8192204d8aa2'

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
            :prefix => prefix,
            :enable_kernel_poll => true,
            :enable_treads => true,
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
