alias aptup='sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade'
# http://stackoverflow.com/a/1315213
alias svna='svn st | awk '\''{print $2}'\'' | xargs -I {} svn add {}'
alias gita='git add -A . && git commit'
