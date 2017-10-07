#!/bin/sh

# abort if we're already inside a TMUX session
[ "$TMUX" == "" ] || exit 0

# tmuxinator
tmuxinator daily

# present menu for user to choose which workspace to open
PS3="Please choose your session: "
options=($(tmux list-sessions -F "#S") "NEW SESSION" "BASH")
echo "Available sessions"
echo "------------------"
echo " "
select opt in "${options[@]}"
do
    case $opt in
        "NEW SESSION")
            read -p "Enter new session name: " SESSION_NAME
            tmux new -s "$SESSION_NAME"
            break
            ;;
        "BASH")
            bash --login
            break;;
        *)
            tmux attach-session -t $opt
            break
            ;;
    esac
done
