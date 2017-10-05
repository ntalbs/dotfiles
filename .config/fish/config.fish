set -x SHELL /usr/local/bin/fish
set -x BRAZIL_CLI_BIN /apollo/env/SDETools/bin
set -x PATH $BRAZIL_CLI_BIN /usr/local/crux /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin /usr/local/share/git-core/contrib/diff-highlight /workplace/AVClientServicesDevScripts/bin
set -x JAVA8_HOME (/usr/libexec/java_home -v1.8)
set -x JAVA9_HOME (/usr/libexec/java_home -v9)
set -x JAVA_HOME $JAVA8_HOME

set -x PGDATA /usr/local/pgsql/data
set -x EDITOR vim

alias java8 "set -x JAVA_HOME $JAVA8_HOME"
alias java9 "set -x JAVA_HOME $JAVA9_HOME"
alias bu "brew update; brew upgrade --all; brew cleanup; brew doctor"

alias pg_start "pg_ctl start -l /usr/local/pgsql/data/logfile"
alias pg_stop "pg_ctl stop"

alias g  "git"
alias b  "brazil"
alias bb "brazil-build"

alias post-review "post-review -u av-device-access-dev"
