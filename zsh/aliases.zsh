alias reload!='. ~/.zshrc'
alias upgrade!='dot'

# disable autocorrect and run as admin
alias mtr="nocorrect sudo mtr"

# generate password
# optional variable is the length of the password (otherwise 26)
genpwd() {
  PW=$(openssl rand -base64 32 | head -c${1-26});
  echo 'new password: '$PW;
  echo $PW | pbcopy;
}
