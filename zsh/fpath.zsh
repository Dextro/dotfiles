#add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder ($DOTFILES/*) 
  if [ -d $topic_folder ]; then  
    # fpath=($topic_folder $fpath); 
  fi;

# own functions
fpath=($DOTFILES/functions $fpath)

fpath=(/usr/local/share/zsh-completions $fpath)