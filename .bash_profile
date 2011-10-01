# aliases
alias cd..="cd .."
alias l="ls -al"
alias ls="ls -FG"
alias lp="ls -p"
alias h=history

# the "kp" alias ("que pasa"), in honor of tony p.
alias kp="ps auxwww"

alias ss="/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background &"

# ant/java stuff
alias ant=/opt/local/bin/ant
export HOSTNAME=gibson
export ANT_HOST_NAME=gibson
export ANT_HOME=/opt/local/share/java/apache-ant
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0
# export TOMCAT_HOME=/Users/al/tomcat-6.0.16
# PATH=${JAVA_HOME}/bin:${PATH}:/usr/local/mysql/bin:/usr/local/ant-1.6.5/bin

# jruby
# export JRUBY_HOME=/Users/al/Apps/jruby-0.9.2
# PATH=${PATH}:/Users/al/Apps/jruby-0.9.2/bin

# maven 2.0.8 config
# export M2_HOME=/Users/al/Local/maven-2.0.8
# export M2=${M2_HOME}/bin
# PATH=${M2}:${PATH}:

# general path munging
PATH=${PATH}:~/bin
PATH=${PATH}:/usr/local/bin
PATH=${PATH}:~/Developer/android-sdk-mac_x86/tools
PATH=${PATH}:~/Developer/android-sdk-mac_x86/platform-tools

# postgres
# export PATH=${PATH}:/usr/local/pgsql/bin
# export PGDATA=/usr/local/pgsql/data

# configure my multi-line prompt
PS1="
\u@\h:\W \T
\$ ==> "

#-----#
# X11 #
#-----#
export DISPLAY=:0.0
PATH=${PATH}:/usr/X11R6/bin
