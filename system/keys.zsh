# Pipe my public keys to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Personal public key copied to pasteboard'"
alias pubkeywijs="more ~/.ssh/wijs_rsa.pub | pbcopy | echo '=> Wijs public key copied to pasteboard'"
