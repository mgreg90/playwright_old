#!/bin/bash

playwright() {
  # Throw an error message if no arg is given
  [ -z "$1" ] && echo "You gotta supply an argument bruh"
  export PLAYWRIGHT_BASH_PROFILE="$1"
  case $PLAYWRIGHT_BASH_PROFILE in
    # 'install')
    #   # Create file structure
    #   md -pv ~/playwright/plays ~/playwright/lib/classes ~/playwright/lib/modules ~/playwright/shell ~/playwright/.src
    #   # Copy this repo over
    #   cp -Rv $(pwd) ~/playwright/.src
    #   # Blammo! Done installing!
    #   echo 'Playwright has been installed!'
    #   ;;
  esac

}
