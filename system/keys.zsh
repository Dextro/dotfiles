# Pipe my public keys to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Personal public key copied to pasteboard'"
alias pubkeydg="more ~/.ssh/dg_rsa.pub | pbcopy | echo '=> Duke & Grace public key copied to pasteboard'"
