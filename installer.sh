#!/bin/bash

# Welcome to playwright!

function install() {
  
  # Cancels install if same version
  if [ -d ~/playwright ]
  then
    CURRENT_VERSION=$(cat ~/playwright/.src/.version)
  else
    CURRENT_VERSION=0
  fi
  NEW_VERSION=$(cat .version)
  [ $CURRENT_VERSION -ge $NEW_VERSION ] && echo "You already have the latest version installed!" && return 0
  
  # Store bash profile path in variable
  export PLAYWRIGHT_BASH_PROFILE=$1
  export SOURCE_PLAYWRIGHT="$HOME/playwright/.src/playwright.sh"
  
  # Cancel install if no bash profile given
  [ -z "$PLAYWRIGHT_BASH_PROFILE" ] && echo "You gotta gimme your bash profile bruh" && return 1
  
  # Cancel install if invalid bash profile path is given
  if [ ! -f "$PLAYWRIGHT_BASH_PROFILE" ]
  then
    echo "Invalid bash profile path bruh"
    return 1
  fi
  
  # Copy current files to temp path
  [ -d ~/playwright ] && cp -R ~/playwright ~/playwright_temp
  
  # Create file structure
  mkdir -p ~/playwright/plays ~/playwright/shell ~/playwright/.src
  touch ~/playwright/shell/.generated_commands.sh ~/playwright/shell/user_commands.sh
  echo 'File Structure Created'
  
  # Copy this repo over
  rm -rf ~/playwright/.src
  cp -R $(pwd) ~/playwright/.src
  
  # Move playwright_play over
  mv ~/playwright/.src/lib/playwright_play ~/playwright/plays/playwright_play
  echo 'Repo Copied Over'
  
  # source playwright.sh in bash profile
  if grep -q "$SOURCE_PLAYWRIGHT" "$PLAYWRIGHT_BASH_PROFILE"
  then
    echo 'playwright.sh Already Sourced'
  else
    echo "\n# Source playwright ruby scripting framework\nexport SOURCE_PLAYWRIGHT=\"$SOURCE_PLAYWRIGHT\"\nexport PLAYWRIGHT_BASH_PROFILE=\"$1\"\nsource \"$SOURCE_PLAYWRIGHT\"" >> $PLAYWRIGHT_BASH_PROFILE || (echo "Invalid Bash Profile Path!" && return 1)
    echo 'Sourced playwright.sh'
  fi
  
  # Remove playwright_temp
  [ -d ~/playwright_temp ] && rm -rf ~/playwright_temp
  
  # Blammo! Done installing!
  if [[ $PLAYWRIGHT_BASH_PROFILE == *"zsh"* ]]
  then
    exec zsh
  fi
  source "$PLAYWRIGHT_BASH_PROFILE"
  echo 'Playwright has been installed!'
}

function uninstall() {
  # Return playwright to original state
  if [ -d ~/playwright_temp ]
  then
    cp -R ~/playwright_temp ~/playwright
    rm -rf ~/playwright_temp
  else
    rm -rf ~/playwright
  fi
  
  # Remove lines that source playwright
  if grep -Fxq "$SOURCE_PLAYWRIGHT" $PLAYWRIGHT_BASH_PROFILE
  then
    echo "$SOURCE_PLAYWRIGHT"
    echo "$PLAYWRIGHT_BASH_PROFILE"
    sed -i '' "$SOURCE_PLAYWRIGHT" $PLAYWRIGHT_BASH_PROFILE
    # sed -i '' "# Source playwright ruby scripting framework" $PLAYWRIGHT_BASH_PROFILE
    # sed -i '' "export PLAYWRIGHT_BASH_PROFILE=\"$1\"" $PLAYWRIGHT_BASH_PROFILE
  fi
  echo "Install failed!"
}

install "$@" || uninstall