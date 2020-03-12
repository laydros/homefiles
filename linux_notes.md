# Random Linux notes
There is a lot of stuff I end up wanting to refer to later. I'm putting some here.

### Set caps as ctrl
Doing it this way seems to work across the console and X:

Edit `/etc/default/keyboard` and set:
~~~
XKBOPTIONS=ctrl:nocaps
~~~
If you already have XKBOPTIONS set, append `ctrl:nocaps` to its existing value using a comma for separator, e.g.:
~~~
XKBOPTIONS="terminate:ctrl_alt_bksp,ctrl:nocaps"
~~~

Should be effective after next reboot or issuing the `setupcon` command.

### macOS
- os x - pipe to `pbcopy` for clipboard
- os x - sharing:
create share points for afp, ftp and smb services.
A new utility on OS X Mountain Lion which lets you quickly share directories from the command line, e.g.:
`sudo sharing -a /Users/you/yourshare`

### rando
~~~
# list directory sizes
$ du -sh *

# count all occurrences of a string in a directory
$ grep -roh lorem . | wc -w

# watch a remote log
$ ssh user@server "tail -f /var/log/apache2/error.log"

# Create directories a through z inside log/users/, creating any parent directories that don't exist yet too.
$ mkdir -p log/users/{a..z}

# brace expansion example
$ mkdir -p drupal/sites/all/modules/{contrib,custom,patched,features}

# launch program and ditch so term can be closed
$ <command> & disown

# df with posix mode, don't make 80 columns wide
$ df -hP

cat <file> | tee output.txt | grep <term>

- grep -r -i somethingtosearchfor ./
- pgrep - search processes
- ngrep - monitor network activity
~~~

### splitting files ###
~~~
# Split a file called largefile into 1 gigabyte pieces called split-xaa, split-xab, split-xac ...
$ split -b 1G verylargefile split

# Join the splits back together
$ cat split-xaa split-xab split-xac > rejoinedlargefile

# Here is a way to join the files together with brace expansion. Be mindful of filenames and order.
$ cat split-xa{a,b,c} > rejoinedlargefile

~~~

### rsync

~~~
/usr/local/bin/rsync --info=progress2 --modify-window=1 -rltvh --no-perms /var/run/importcopy/tmpdir/dev/da3p1/ /mnt/storpool/share
~~~
`rsync -essh -rtpvz` rocks. Really, there’s nothing more to say. Learn it. Use it. Love it. Here’s a good rsync anecdote: in my last job, I worked on a project that was doing daily (and sometimes more-than-once-per-day) builds of a 100 MB installer. Near the end of the release cycle, we were putting each daily build on a private web server for the client to download and test. Uploading the entire build took over a hour on my capped DSL line. It turns out that the fastest way to do this is to ssh into the server, duplicate yesterday’s build to a file with today’s date, then rsync today’s build up to the server. rsync magically figures out which parts of the installer have changed (usually not more than a few KB) and synchronizes the build in under a minute. I have no idea how it does that. I read once that it was somebody’s PhD project. Thank God for smart people.
