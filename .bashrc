# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
RESET="\[$(tput sgr0)\]"

# Prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="dev-dsk-seongjun ${GREEN}\w${YELLOW}\$(parse_git_branch)${RESET} > "

BRAZIL_CLI_BIN=/apollo/env/BrazilCLI/bin
BARK_CLI_BIN=/apollo/env/BarkCLI/bin
AMAZON_AWS_CLI_BIN=/apollo/env/AmazonAwsCli/bin
ENV_IMPROVEMENT_BIN=/apollo/env/envImprovement/bin
export PATH=$BRAZIL_CLI_BIN:$BARK_CLI_BIN:$ENV_IMPROVEMENT_BIN:$AMAZON_AWS_CLI_BIN:$PATH

alias k="kinit -f"
alias b="brazil"
alias bb="brazil-build"
alias bws="brazil ws show"
alias cdp="cd /workplace/DeviceProxy/src/ATVDeviceProxy"
alias cdpa="cd /apollo/env/ATVDeviceProxy"
alias cdpal="cd /apollo/env/ATVDeviceProxy/var/output/logs"
alias cdis="cd /workplace/DIS/src/ATVDeviceInitializationService"
alias cdisa="cd /apollo/env/ATVDeviceInitializationService"
alias cdisal="cd /apollo/env/ATVDeviceInitializationService/var/output/logs"
alias attach-dp="brazil ws env attach --alias ATVDeviceProxy"
