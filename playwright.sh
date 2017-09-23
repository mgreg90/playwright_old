#!/bin/bash

playwright() {
  # Throw an error message if no arg is given
  [ -z "$1" ] && echo "You gotta supply an argument bruh"
  export PLAYWRIGHT_BASH_PROFILE="$1"
  case $PLAYWRIGHT_BASH_PROFILE in
    # Throw an error if they try to install without giving the path to their bash profile
    # [ -z "$2" ] && echo "You gotta gimme your bash profile bruh"
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
