set -x SHELL /usr/local/bin/fish
set -x EDITOR vim
set -x TOOLBOX_BIN ~/.toolbox/bin
set -x PATH $TOOLBOX_BIN /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin /usr/local/share/git-core/contrib/diff-highlight /workplace/AVClientServicesDevScripts/bin

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
alias '..' "cd .."
alias '...' "cd ../.."
alias '....' "cd ../../.."
alias 'cd..' "cd .."

# edit-and-execute-command
function edit-commandline
  set -q EDITOR; or return 1
  set -l tmpfile (mktemp); or return 1
  commandline > $tmpfile
  eval $EDITOR $tmpfile
  commandline -r -- (cat $tmpfile)
  rm $tmpfile
end
bind \cx\ce edit\-commandline
