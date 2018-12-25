#add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder ($ZSH/*) 
  if [ -d $topic_folder ]; then  
    # fpath=($topic_folder $fpath); 
  fi;

# own functions
fpath=($ZSH/functions $fpath)

fpath=(/usr/local/share/zsh-completions $fpath)