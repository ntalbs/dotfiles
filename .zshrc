# .zshrc for Warp

MY_BIN=~/bin
AC_DEV_TOOL_BIN=/workplace/ACDevTooling/bin
CARGO_BIN=$HOME/.cargo/bin
TOOLBOX_BIN=$HOME/.toolbox/bin
export PATH=$MY_BIN:$CARGO_BIN:$TOOLBOX_BIN:$AC_DEV_TOOL_BIN:/usr/local/bin:/usr/local/sbin:/workplace/devtools/src/ATVAndroidDevTools/gradle/scripts:$PATH

export JAVA8_HOME=/usr/local/opt/openjdk@8/libexec/openjdk.jdk/Contents/Home
export JAVA11_HOME=/usr/local/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home
export JAVA18_HOME=/usr/local/opt/openjdk@18/libexec/openjdk.jdk/Contents/Home

alias java8="export JAVA_HOME=$JAVA8_HOME"
alias java11="export JAVA_HOME=$JAVA11_HOME"
alias java18="export JAVA_HOME=$JAVA18_HOME"

# alias
alias ls="exa -F"
alias cat=bat

alias k="kinit -f"
alias b="brazil"
alias bb="brazil-build"
alias bws="brazil ws show"
alias brb="brazil-recursive-cmd brazil-build"

alias cdp="cd /workplace/Github"
alias cdr="cd /workplace/Github/rust"
alias cdis="cd /workplace/DIS/src/ATVDeviceInitializationService"

alias cd..="cd .."
alias ..="cd .. "
alias ...="cd ../.."
alias ....="cd ../../.."

alias cdacm="cd /workplace/ACM"
alias cdd="cd /workplace/ACM/AVDuotronics/src/AVDuotronics"
alias cda="cd /workplace/ACM/AVDuotronicsAdmin/src/AVDuotronicsAdmin"
alias cdn="cd /workplace/ACN/ACNClientNotificationService/src/ACNClientNotificationService"
alias lsync="sudo killall lsyncd; sudo lsyncd ~/lsync.cfg; tail -f /var/log/lsyncd.log"

alias aatc="ada credentials update --account=884307244203 --provider=conduit --role=IibsAdminAccess-DO-NOT-DELETE --once"

# brew
alias bu="brew update; brew upgrade; brew cleanup; brew doctor"

. "$HOME/.cargo/env"
export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"
