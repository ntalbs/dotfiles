set -x SHELL /usr/local/bin/fish
set -x EDITOR vim
set -x TOOLBOX_BIN ~/.toolbox/bin
set -x PATH $TOOLBOX_BIN ~/.avne/bin ~/bin /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin /usr/local/share/git-core/contrib/diff-highlight /workplace/AVClientServicesDevScripts/bin ~/.cargo/bin

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
alias cdacm "cd /workplace/ACM"
alias cdd "cd /workplace/ACM/AVDuotronics"
alias cda "cd /workplace/ACM/AVDuotronicsAdmin"
alias 'update-avne' "/usr/bin/curl --negotiate -fLSsu: 'https://drive.corp.amazon.com/view/ahmadida%40/scripts/avne-install.sh' -o /tmp/avne-install.sh; and /bin/bash /tmp/avne-install.sh"

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
