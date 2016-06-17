set -x SHELL /usr/local/bin/fish
set -x PATH /apollo/env/SDETools/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/local/share/git-core/contrib/diff-highlight
set -x JAVA8_HOME (/usr/libexec/java_home -v1.8)
set -x JAVA_HOME $JAVA8_HOME

set -x PGDATA /usr/local/pgsql/data
set -x EDITOR vim

alias java8 "set -x JAVA_HOME $JAVA8_HOME"
alias bu "brew update; brew upgrade --all; brew cleanup; brew doctor"

alias pg_start "pg_ctl start -l /usr/local/pgsql/data/logfile"
alias pg_stop "pg_ctl stop"

alias g  "git"
alias b  "brazil"
alias bb "brazil-build"

alias post-review "post-review -u dv-clientsvcs-dev"
