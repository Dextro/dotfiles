alias reload!='. ~/.zshrc'
alias upgrade!='dot'
alias c='clear'

# disable autocorrect and run as admin
alias mtr="nocorrect sudo mtr"

# generate password
# optional variable is the length of the password (otherwise 26)
genpwd() {
  string=$(openssl rand -base64 32);
  substring=$string[0,${1-26}];
  echo 'new password: '$substring;
  echo $substring | tr -d '\n' | pbcopy;
}

# clear cache of Mac OS X 10.10.4
alias cc="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; echo 'local DNS cache cleared';"

# clear cache of Mac OS X 10.10.3 and lower
# alias cc="sudo discoveryutil udnsflushcaches && echo 'cache cleared'"

# GAM
alias gam="~/bin/gam/gam"
