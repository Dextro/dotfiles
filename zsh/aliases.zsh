alias reload!='. ~/.zshrc'
alias upgrade!='dot'
alias c='clear'

# disable autocorrect and run as admin
alias mtr="nocorrect sudo mtr"

# generate password
# optional variable is the length of the password (otherwise 26)
genpwd2() {
  string=$(openssl rand -base64 32);
  substring=$string[0,${1-26}];
  echo 'new password: '$substring;
  echo $substring | tr -d '\n' | pbcopy;
}

#!/bin/zsh

# Function to generate a random readable password
genpwd() {
  # Path to the dictionary file
  local dictionary="/usr/share/dict/words"

  # Check if the dictionary file exists
  if [[ ! -f $dictionary ]]; then
    echo "Dictionary file not found at $dictionary."
    exit 1
  fi

  # Function to get a random word from the dictionary
  get_random_word() {
    # Use shuf to pick a random line from the dictionary
    shuf -n 1 "$dictionary" | tr -d '\n'
  }

  # Function to get a random special character
  get_random_special_character() {
    local special_characters='!@#$%^&*()_+-=[]{}|;:,.<>?'
    local index=$((RANDOM % ${#special_characters}))
    echo "${special_characters[index]}"
  }

  local password=""
  
  # Loop until a password of the desired length is generated
  while true; do
    # Determine a random number of words between 2 and 4
    local num_words=$((RANDOM % 3 + 2))  # Generates a number between 2 and 4

    # Generate a random password using the random number of words
    password=""
    for i in $(seq 1 $num_words); do
      local word=$(get_random_word)
      password+="${word}"

      # Optionally add a random number of special characters or numbers between words
      if [[ $i -lt $num_words ]]; then
        local num_inserts=$((RANDOM % 6))  # Number of characters to insert between 0 and 5
        for _ in $(seq 1 $num_inserts); do
          if [[ $((RANDOM % 2)) -eq 0 ]]; then
            # Insert a random special character
            password+="$(get_random_special_character)"
          else
            # Insert a random number
            password+="$((RANDOM % 10))"
          fi
        done
      fi
    done

    # Check if the password length is within the desired range
    local password_length=${#password}
    if (( password_length >= 14 && password_length <= 32 )); then
      break
    fi
  done

  echo 'new password: '$password;
  echo $password | tr -d '\n' | pbcopy;
}

# clear cache of Mac OS X 10.10.4
alias cc="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; echo 'local DNS cache cleared';"
