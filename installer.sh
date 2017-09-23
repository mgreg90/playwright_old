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
  [ $CURRENT_VERSION -ge $NEW_VERSION ] && echo "You already have the latest version installed!" && return 1
  
  # Cancel install if no bash profile given
  [ -z "$1" ] && echo "You gotta gimme your bash profile bruh" && return 1
  
  # Cancel install if invalid bash profile path is given
  [ -d "$1" ] && echo "Invalid bash profile path bruh" && return 1
  
  # Copy current files to temp path
  [ -d ~/playwright ] && cp -R ~/playwright ~/playwright_temp
  
  # Store bash profile path in variable
  export PLAYWRIGHT_BASH_PROFILE="$1"
  
  # Create file structure
  mkdir -p ~/playwright/plays ~/playwright/lib/classes ~/playwright/lib/modules ~/playwright/shell ~/playwright/.src
  echo 'File Structure Created'
  
  # Copy this repo over
  mv "$(pwd)/.git" "$(pwd)/.git_temp"
  rm -rf ~/playwright/.src
  cp -R $(pwd) ~/playwright/.src
  mv "$(pwd)/.git_temp" "$(pwd)/.git"
  echo 'Repo Copied Over'
  
  # source playwright.sh in bash profile
  TEST_STRING="source \"$HOME/playwright/.src/playwright.sh\""
  if grep -q "$TEST_STRING" "$PLAYWRIGHT_BASH_PROFILE"
  then
    echo 'playwright.sh Already Sourced'
  else
    echo "\n\n# Source playwright ruby scripting framework\n$TEST_STRING" >> $PLAYWRIGHT_BASH_PROFILE || (echo "Invalid Bash Profile Path!" && return 1)
    echo 'Sourced playwright.sh'
  fi
  
  # Remove playwright_temp
  [ -d ~/playwright_temp ] && rm -rf ~/playwright_temp
  
  # Blammo! Done installing!
  echo 'Playwright has been installed!'
  echo 'Please restart your terminal.'
  
}

function uninstall() {
  if [ -d ~/playwright_temp ]
  then
    cp -R ~/playwright_temp ~/playwright
    rm -rf ~/playwright_temp
  else
    rm -rf ~/playwright
  fi
  
  if grep -Fxq "$TEST_STRING" $PLAYWRIGHT_BASH_PROFILE
  then
    sed -i "$TEST_STRING" $PLAYWRIGHT_BASH_PROFILE
    sed -i "# Source playwright ruby scripting framework" $PLAYWRIGHT_BASH_PROFILE
  fi
  echo "Install failed!"
}

install "$@" || uninstall