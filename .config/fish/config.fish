set -x PATH ~/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin
set -x JAVA8_HOME (/usr/libexec/java_home -v1.8)
set -x JAVA7_HOME (/usr/libexec/java_home -v1.7)
set -x JAVA_HOME $JAVA8_HOME

alias java8 "set -x JAVA_HOME $JAVA8_HOME"
alias java7 "set -x JAVA_HOME $JAVA7_HOME"
alias bu "brew update; brew upgrade; brew cleanup; brew doctor"
