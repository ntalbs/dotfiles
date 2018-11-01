set -x SHELL /usr/local/bin/fish
set -x EDITOR vim
set -x TOOLBOX_BIN ~/.toolbox/bin
set -x PATH $TOOLBOX_BIN /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin /usr/local/share/git-core/contrib/diff-highlight /workplace/AVClientServicesDevScripts/bin

# JDK
function switch-jdk
  set -x JAVA_HOME (/usr/libexec/java_home $argv[1])
end

alias java8  "switch-jdk -v1.8"
alias java9  "switch-jdk -v9"
alias java11 "switch-jdk -v11"

# brew
alias bu "brew update; brew upgrade; brew cleanup; brew doctor"

# postgresql
set -x PGDATA /usr/local/pgsql/data
alias pg_start "pg_ctl start -l /usr/local/pgsql/data/logfile"
alias pg_stop "pg_ctl stop"

# my aliases
alias g  "git"
alias b  "brazil"
alias bb "brazil-build"
alias 'cd..' "cd .."
