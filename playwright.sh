#!/bin/bash

pw_uninstall() {
  UNINSTALL_SCRIPT="require '~/playwright/.src/commands.rb'; Playwright::Commands.uninstall"
  ruby -e $UNINSTALL_SCRIPT
}

playwright() {
  # echo 'playwright called'

  # Throw an error message if no arg is given
  [ -z "$1" ] && echo "You gotta supply an argument bruh"
  PLAYWRIGHT_COMMAND="$1"
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

