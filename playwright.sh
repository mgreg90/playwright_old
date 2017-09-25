#!/bin/bash

pw_uninstall() {
  
  # [ -d ~/playwright_temp ] && rm -rf ~/playwright
  # SOURCE_PLAYWRIGHT="source \"$HOME/playwright/.src/playwright.sh\""
  # echo "$SOURCE_PLAYWRIGHT"
  # echo "$PLAYWRIGHT_BASH_PROFILE"
  # if grep -Fxq "$SOURCE_PLAYWRIGHT" "$PLAYWRIGHT_BASH_PROFILE"
  # then
  #   echo 'is true'
  #   # TODO: shit is broken here!
  #   sed -i '' "$SOURCE_PLAYWRIGHT" $PLAYWRIGHT_BASH_PROFILE
  #   sed -i '' "# Source playwright ruby scripting framework" $PLAYWRIGHT_BASH_PROFILE
  #   sed -i '' "export PLAYWRIGHT_BASH_PROFILE=\"$1\"" $PLAYWRIGHT_BASH_PROFILE
  # fi
  # echo 'finish'
}

playwright() {
  # echo 'playwright called'

  # Throw an error message if no arg is given
  [ -z "$1" ] && echo "You gotta supply an argument bruh"
  echo "$1"
  PLAYWRIGHT_COMMAND="$1"
  echo $PLAYWRIGHT_COMMAND
  case $PLAYWRIGHT_COMMAND in
    uninstall)
      pw_uninstall
      ;;
  # case $PLAYWRIGHT_BASH_PROFILE in
  #   'uninstall')
  #     echo 'playwright uninstalled called'
  #     pw_uninstall()
  #     ;;
  #   # 'install')
  #   #   # Create file structure
  #   #   md -pv ~/playwright/plays ~/playwright/lib/classes ~/playwright/lib/modules ~/playwright/shell ~/playwright/.src
  #   #   # Copy this repo over
  #   #   cp -Rv $(pwd) ~/playwright/.src
  #   #   # Blammo! Done installing!
  #   #   echo 'Playwright has been installed!'
  #   #   ;;
  # esac
  esac

}

