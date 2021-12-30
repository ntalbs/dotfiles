# .bash_profile
export BASH_SILENCE_DEPRECATION_WARNING=1

export CARGO_BIN=$HOME/.cargo/bin
export PATH=$CARGO_BIN:/usr/local/bin:/usr/local/sbin:$PATH
export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"
