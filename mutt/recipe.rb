class Mutt < FPM::Cookery::Recipe
  description 'ext-based mailreader supporting MIME, GPG, PGP and threading'

  name 'mutt'
  version '1.6.1'
  revision '1'

  source "ftp://ftp.mutt.org/pub/mutt/mutt-#{version}.tar.gz"
  sha256 '98b26cecc6b1713082fc880344fa345c20bd7ded6459abe18c84429c7cf8ed20'

  build_depends 'libncursesw5-dev', 'libgpgme11-dev', 'ispell', 'bison', 'libidn11-dev',
                'libtokyocabinet-dev',
                'libgnutls28-dev', 'libkrb5-dev', 'libncurses5-dev', 'libsasl2-dev',
                'zlib1g-dev'
  depends 'libncursesw5', 'libgpgme11', 'ispell', 'bison', 'libidn11', 'libtokyocabinet9'

  def build
    configure '--prefix=/usr', '--sysconfdir=/etc', '--mandir=/usr/share/man',
              '--with-docdir=/usr/share/doc', '--with-mailpath=/var/mail',
              '--disable-dependency-tracking', '--enable-compressed',
              '--enable-fcntl', '--enable-pop', '--with-curses', '--with-gnutls',
              '--with-gss', '--with-idn', '--with-mixmaster', '--with-sasl',
              '--enable-gpgme', '--enable-imap', '--enable-smtp', '--enable-flock',
              '--enable-exact-address', '--enable-hcache',
              '--without-gdbm', '--without-bdb', '--without-qdbm'
    make
  end

  def install
    make :install, 'DESTDIR' => destdir

    lib('mutt').install 'pgpewrap'
    lib('mutt').install 'pgpring'
    lib('mutt').install 'flea'
    lib('mutt').install 'muttbug'
    lib('mutt').install 'smime_keys'
    lib('mutt').install 'mutt_dotlock'

    rm_rf bin('pgpewrap')
    rm_rf bin('pgpring')
    rm_rf bin('flea')
    rm_rf bin('muttbug')
    rm_rf bin('smime_keys')
    rm_rf bin('mutt_dotlock')
  end
end
