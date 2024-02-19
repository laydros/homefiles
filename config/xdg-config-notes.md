Notes on moving various dotfiles
================================

Taken from https://github.com/grawity/dotfiles file ".dotfiles.notes"

A better list is at <https://wiki.archlinux.org/index.php/XDG_Base_Directory>.

Please also read <.environ.notes> if you find this file useful.


XDG Basedir-compliant
---------------------

Already migrated to XDG in a release:

~/.AndroidStudio4.0	~/.config/Google/AndroidStudio2021.3/
~/.audacity-data/	[various]/audacity/		3.2.0?
~/.curlrc               ~/.config/.curlrc               7.73 (4be1f8dc0)
~/.d-feet/              ~/.config/d-feet/               0.1.15 (7f6104bbc5ab)
~/.darcs/               [various]/darcs/                2.10
~/.freerdp/             ~/.config/freerdp/              1.1.0 (edf6e7258d0e)
~/.gconf/               ~/.config/gconf/                3.2.6 (fc28caa7be86)
~/.gconf.path           ~/.config/gconf.path            3.2.6 (fc28caa7be86)
~/.gimp-2.8/            ~/.config/GIMP/2.10/            2.10
~/.gitconfig            ~/.config/git/config            1.7.12 (0d94427ef844)
~/.gitignore            ~/.config/git/ignore            1.7.12 (0d94427ef844)
~/.gitk                 ~/.config/git/gitk              1.9-rc1 (8f86339858c1)
~/.gnucash/             ~/.config/gnucash/              3.0
~/.hgrc                 ~/.config/hg/hgrc               4.2 (354020079723)
~/.irbrc                ~/.config/irb/irbrc
~/.keybase/             [various]/keybase/              0.6.0 (99531f058b3b57)
~/.lesshst              ~/.local/state/lesshst          608
~/.lesshst              ~/.local/share/lesshst [note]   582
~/.lesskey              ~/.config/lesskey               582
~/.lftp/                ~/.config/lftp/
~/.lftprc               ~/.config/lftp/rc
~/.makepkg.conf         ~/.config/pacman/makepkg.conf   4.2.0
~/.mpdconf              ~/.config/mpd/mpd.conf          0.18
~/.mpoprc               ~/.config/mpop/config           1.2.7 (c70f9da)
~/.mpv/                 ~/.config/mpv/                  ??? (cb250d)
~/.muttrc               ~/.config/mutt/muttrc           mutt 1.8? (b17cd6731291)
~/.muttrc               ~/.config/neomutt/config        neomutt ??? (239c0e93f8be)
~/.msmtprc              ~/.config/msmtp/config          1.6.3 (af2f409)
~/.offlineimaprc        ~/.config/offlineimap/config    6.5.6 (5150de5514d1)
~/.oidentd.conf         ~/.config/oidentd.conf          post-2.3.2 (8a6e9654889)
~/.pki/nssdb/           ~/.local/share/pki/nssdb/       nss 3.42 (7f21d4f49)
~/.pulse/               ~/.config/pulse/                3.0 (9ab510a69216)
~/.pulse-cookie         ~/.config/pulse/cookie          3.0, 6.0 (59a8618dcd91)
~/.putty/               ~/.config/putty/                0.64 (9952b2d5bd5)
~/.quodlibet/           ~/.config/quodlibet/            3.10.0 (4e9545b2fa0eff6)
~/.rclone.conf          ~/.config/rclone/rclone.conf
~/.tigrc                ~/.config/tig/config[note]      2.1.1 (1e6da9d)
~/.tmux.conf            ~/.config/tmux/tmux.conf        3.1 (3.0a-152-g15d7e564)
~/.VirtualBox/          ~/.local/share/VirtualBox/
~/.weechat/             [various]/weechat/              3.2
~/.wireshark/           ~/.config/wireshark/            1.12


Migrated to XDG in devel:

~/.purple/              ~/.config/purple/               3.0


Notes:

~/.lesshst
        If XDG_DATA_HOME isn't explicitly set, there is no fallback to the
        default ~/.local/share/, but only to the legacy ~/.lesshst path.
        (However, fallback *is* implemented for XDG_STATE_HOME to
        ~/.local/state/.)

~/.lesskey
        Unlike ~/.lesshst, this path does fallback to ~/.config/ if
        XDG_CONFIG_HOME was not found in environment.

~/.tigrc
        Instead of a standalone tigrc, configuration can be embedded in the Git
        config file via [tig ...] sections.


Environment variable
--------------------

These paths can be overridden using an environment variable. (CLI options might
be included if available in addition to environment.)

Items marked "(xdg)" are already compliant in the current version, and included
only for reference.

~/.atom/                $ATOM_HOME
~/.cabal/config         $CABAL_CONFIG
~/.crawl/               $CRAWL_DIR (must end with "/")
~/.crawlrc              $CRAWL_RC, or move to $CRAWL_DIR/init.txt
~/.curlrc               (xdg) $CURL_HOME
~/.cvspass              $CVS_PASSFILE
~/.dvdcss/              $DVDCSS_CACHE
~/.e16/                 $ECONFDIR, -P, --econfdir, see /usr/share/doc/e16/e16.html
~/.elinks/              $ELINKS_CONFDIR
~/.gale/                $GALE_DIR
~/.gemrc                $GEMRC (colon-separated list, acts as additional rc)
~/.gnupg/               $GNUPGHOME, --home
~/.gramps/              $GRAMPSHOME
~/.gtkrc                $GTK_RC_FILES (colon-separated list)
~/.gtkrc-2.0            $GTK2_RC_FILES (colon-separated list)
~/.httpie/              $HTTPIE_CONFIG_DIR
~/.ICEauthority         $ICEAUTHORITY
~/.irbrc                $IRBRC
~/.ipfs/                $IPFS_PATH
~/.ldaprc               $LDAPCONF, $LDAP<opt>, see ldap.conf(5)
~/.lesshst              (xdg) $LESSHISTFILE
~/.mtoolsrc             $MTOOLSRC (acts as additional rc)
~/.mysql_history        $MYSQL_HISTFILE
~/.pip/pip.conf         $PIP_CONFIG_FILE, $PIP_<opt>
~/.pip/pip.log          $PIP_LOG_FILE, [global] log_file =
~/.screenrc             $SCREENRC
~/.sqlite_history       $SQLITE_HISTORY
~/.tpm2_pkcs11/		$TPM2_PKCS11_STORE
~/.tkabber              $TKABBER_HOME
~/.unison/		$UNISON
~/.VirtualBox/          (xdg) $VBOX_USER_HOME
~/.weechat/             (xdg) $WEECHAT_HOME, -d, --dir
~/.wgetrc               $WGETRC


Can be overridden indirectly via config:

~/.cabal/*
        Defined via various settings in $CABAL_CONFIG

~/.lynx_cookies
        Defined via 'cookie_file' in ~/.lynxrc

~/.pip/pip.log
        Location can be defined via pip.conf (see ~/.pip/pip.conf), but this
        does not support tilde expansion for $HOME:

        [global]
        log_file = /home/foo/bar

        http://pip.readthedocs.org/en/latest/user_guide.html#environment-variables

~/VirtualBox VMs/
        Location defined by main VirtualBox configuration (see ~/.VirtualBox/),
        can be set via GUI or `VBoxManage setproperty machinefolder <path>`


Command-line override
---------------------

These support neither XDG Basedir nor custom environment variables, but can be
run through an alias or wrapper script with a specific command line option.

~/.claws-mail/          --alternate-config-dir
~/.gdbinit              gdb -nh -x <path>
~/.irssi/               --home=
~/.pinerc               -p
~/.stalonetrayrc        -c, --config
~/.ttytterrc            -rc=
~/.vidalia/             -datadir
~/.wget-hsts            --hsts-file=
~/.xbindkeysrc          -f, --file
~/.xbindkeysrc.scm      -fg, --file-guile
~/.xinitrc              startx <path>
~/.xchat2/              -d, --cfgdir=
~/.xsel.log             -l, --logfile


Notes:

~/.digrc
        No option to load a different config, but everything that can be put in
        .digrc can be directly specified via command-line options anyway.

~/.pinerc
        Windows gets both $PINERC and $PINECONF, but Unix gets neither.

The Java hack
-------------

For various Java programs that litter the home directory, the answer is "change
the home directory". I have a wrapper script that basically runs:

        java -Duser.home="$XDG_DATA_HOME/Java"

Don't forget to symlink ~/.java into the redirect directory.

~/.ApacheDirectoryStudio/
~/.java/
~/.swt/
~/Ubiquiti-Networks/


Hardcoded
---------

Sad.

~/.aMule/
~/.balsa/
~/.bash_logout
~/.bash_profile         Use ~/.profile
~/.cargo/
~/.cmake/		Supports Windows and Haiku paths but not XDG
~/.dc++/
~/.esd_auth             Obsolete, uninstall the PulseAudio module
~/.fossil
~/.gens/                Hardcoded in both Gens and Gens-gs
~/.gnome-commander/     Command-line option doesn't work
~/.gnome2/              Obsolete, safe to rm
~/.gnome2_private/      Obsolete, safe to rm
~/.gstreamer-0.10/      Obsolete, safe to rm (Gst1.0 is XDG)
~/.hatari/
~/.pine-debug[0-9]
~/.renpy/
~/.subversion/
~/.w3m/


Some paths have become API and are expected to be there by various programs:

~/.dbus/                part of D-Bus spec, but optional - see note
~/.netrc                curl, many other apps, Perl/Python modules expect it here
~/.profile              sh, bash, various display managers expect it here
~/.xprofile             various display managers (Xsession scripts) expect it here
~/.ssh/                 libssh2, other programs will parse config & known_hosts


Notes:

~/.dbus/
        The path ~/.dbus/session-bus/$MACHINE_ID-$DISPLAY is part of the D-Bus
        spec, however, it is only needed when "autolaunch" is being used.

        On systems which always pre-start a session bus and export its path to
        DBUS_SESSION_BUS_SOCKET (whether via systemd or via dbus-run-session),
        the ~/.dbus/ directory doesn't need to exist at all.

~/.kvirc4.rc
        Hardcoded, but will use native KDE location if compiled with "KDE
        support" enabled.

~/.pki/nssdb/
        Although upstream NSS is XDG-compliant as of 3.42 (commit 7f21d4f49)
        and uses ~/.local/share/pki/nssdb/, this doesn't yet apply to Google
        Chrome (v84) as it uses an older vendor fork of NSS in which the path
        is still hardcoded.

        (It also doesn't apply to Firefox/Thunderbird/Seamonkey which use per-
        profile databases as they always have done.)

Miscellaneous
-------------

~/.aspell.conf – environment
  - the 'per-conf' statement in /etc/aspell.conf or $ASPELL_CONF overrides
    ('per-conf-path' as well, except `aspell config` doesn't output that one)
  - contents of $ASPELL_CONF are parsed before all configuration files
    (semicolon-separated)
  - example (no inner quoting needed):
    ASPELL_CONF="per-conf $XDG_CONFIG_HOME/aspell.conf; personal ...; repl ..."
  - documentation: `info aspell customizing`

~/.aspell.<lang>.{per,prepl,pws,repl} – partially configurable
  - *.pws: the 'personal' statement in ~/.aspell.conf (or $ASPELL_CONF &c.) overrides
  - *.prepl: the 'repl' statement overrides
  - no environment variables or ~ though; use $ASPELL_CONF for that
  - in theory, literal "<lang>" should do the right substitution, but doesn't
    (which means you're limited to one language if you choose to override!)

~/.bashrc – hardcoded / command-line
  - you could use --init-file/--rcfile, but you'll generally need at least a
    wrapper script for that, since many programs invoke /bin/sh directly

~/.eclipse/
        Just give up.

        Option "-Dosgi.configuration.area=@user.home/.config/etc/etc" overrides
        the location, but must be added to "$ECLIPSE_HOME/eclipse.ini" rather
        than command line -- which means you must have write access to
        $ECLIPSE_HOME, that is, carry your own copy of Eclipse, and I couldn't
        really get it to work anyway (Arch's /usr/bin/eclipse has a hardcoded
        $ECLIPSE_HOME).

        docs: <http://wiki.eclipse.org/Eclipse.ini>

~/.exodusviewer/
        $EXODUSVIEWER_USER_DIR overrides, but see ~/.secondlife/

~/.firestorm/
        $FIRESTORM_USER_DIR overrides, but see ~/.secondlife/

~/.forward – varies
  - most MTAs expect this path, and it's not like they can read .profile
  - some can be reconfigured system-wide (if you have root access)
  (Exim4 – configurable)
    - "file = $home/<path>" overrides (Exim uses a generic 'redirect' router)
  (Postfix – configurable)
    - "forward_path = $home/<path>" overrides
  (Procmail – other options)
    - can use a custom redirect rule instead
  (general – other options)
    - most MTAs have a system-wide 'aliases' file that works the same way

~/.git-credentials – partly-XDG as of 2.3.8? 2.4? (17c7f4d8e4); command line
  - $XDG_CONFIG_HOME/git/credentials is used *if exists*
  - "--file=<path>" option exists

~/.gvimrc
        Same as ~/.vimrc, but with GVIMINIT.

~/.kde/, ~/.kde4/
  - $KDEHOME overrides the default
  - optionally $KDEDIRS can point to additional read-only paths
  - <http://techbase.kde.org/KDE_System_Administration/KDE_Filesystem_Hierarchy>
  - <http://techbase.kde.org/KDE_System_Administration/Configuration_Files>

~/.local (Python user_base) – configurable/environment
  - $PYTHONUSERBASE overrides
  - note that user_base is independent of XDG ~/.local/share

~/.lynxrc – hardcoded
  - userdefs.h:/FNAME_LYNXRC/
  - src/LYrcFile.c:/(read|save)_rc/
  - possibly, lynx.cfg ($LYNX_CFG) could be used instead?

~/.mailrc – environment [varies]
  (Mail – environment)
    - $MAILRC overrides
  (nail, heirloom-mailx, s-nail – environment)
    - $MAILRC overrides default
    - $NAILRC overrides both

~/.netrc
        Mostly API, though some apps can be told to use a different path.

        (curl – environment)
        - $CURLOPT_NETRC_FILE overrides
        - should work with libcurl programs too; not tested
        - "--netrc-file <path>" overrides
        (GNU inetutils `ftp` – environment)
        - $NETRC overrides as of 1.9.3 (commit 38246ac903db)
        (lftp – hardcoded)
        (Perl 'CPAN::FTP::netrc' – hardcoded)
        (Perl 'Net::Netrc' – hardcoded)
        (s-nail – environment)
        - $NETRC overrides
        (w3m – hardcoded)
        (wget – hardcoded)
        - can use .wgetrc instead

~/.npm/ – configurable
  - "cache = <dir>" in ~/.npmrc or $PREFIX/etc/npmrc overrides
  - doc: npm-config(7), npm-cache(1)

~/.npmrc – configurable
  - "userconfig = <path>" in $PREFIX/etc/npmrc overrides
    (or, of course, you could use $PREFIX/etc/npmrc directly)
  - doc: npm-config(7)
  - see also `npm config get globalconfig` & `npm config get userconfig`

~/.opera/ – partial environment
  - $OPERA_PERSONALDIR overrides
  - however, 1 file remains (~/.opera/OperaAutoupdateChecker.sqlite)

~/.rnd
        Not sure what exactly creates this, but at least for OpenSSL (??),
        $RANDFILE can be used to move it into a different *directory*.

~/.secondlife/
        $SECONDLIFE_USER_DIR overrides this in general, but you will need to
        manually adjust the "chat log location" option.

~/.sqldeveloper/
        Hardcoded -- the launcher script ignores java-hack as well.

~/.terminfo/ (ncurses) – environment
  - $TERMINFO_DIRS overrides (colon-separated list):
    - TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
  - $TERMINFO overrides (system path not searched)
  - docs: terminfo(5)

~/.vimrc
        Recent Vim versions use ~/.vim/vimrc by default. For older versions,
        $VIMINIT can have an Ex command that sources an additional rc:

                export VIMINIT=":so ~/.vim/vimrc"

        (Note: This only applies to original Vim -- the Neovim fork is already
        XDG-compliant and uses ~/.config/nvim/init.vim instead.)

~/.XCompose – environment/hardcoded/other locations
  (libxkbcommon)
    - $XDG_CONFIG_HOME/XCompose as of xkbcommon-0.10.0-56-g17ad0df
    - $XCOMPOSEFILE overrides (see the Compose(5) manual page)
  (libX11 aka xim)
    - $XCOMPOSEFILE overrides (see the Compose(5) manual page)
  (GTK aka gtk-im-context-simple)
    - hardcoded ~/.XCompose
       - intentional: https://bugzilla.gnome.org/show_bug.cgi?id=721120#c30
    - but, $XDG_CONFIG_HOME/gtk-3.0/Compose is also supported
    - NOTE: only as of commit a41f02f9b1843e0f0085f801430e55f413a9bf9c
            (previous versions did not use the file at all)
  (ibus)
    - not sure

~/.Xkbmap – hardcoded/configurable
  - hardcoded in /etc/gdm/Xsession (although GNOME uses dconf)
    as well as other Xsession scripts in other DMs
  - however, ~/.xprofile and ~/.xinitrc can use a custom path
  - also, most DEs have their own configurations for this

~/.Xresources – hardcoded/configurable
  - hardcoded in Xsession scripts of many DMs
  - however, ~/.xprofile and ~/.xinitrc can use a custom path

~/mbox
        Various mail apps move "seen" messages here from /var/spool/mail.

        Can usually be disabled or relocated through the mail program's
        configuration (e.g. via ~/.mailrc or $MBOX).

~/FS-UAE/ - environment; configurable?
  - $FS_UAE_BASE_DIR
    deprecated
  - supposedly $XDG_CONFIG_HOME/fs-uae/fs-uae.conf can override it
    (e.g. "base_dir = $HOME/.local/share/fs-uae/")
    but the python-based launcher completely ignores it

~/.*_history (rlwrap) – environment
  - $RLWRAP_HOME specifies an alternative directory
    (e.g. RLWRAP_HOME="$XDG_CACHE_HOME/rlwrap/")
