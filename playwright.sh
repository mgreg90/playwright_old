#!/bin/bash

playwright() {
  ruby ~/playwright/.src/commands.rb "$@"
  if [[ "$1" == "apply" || "$1" == "uninstall" ]]
  then
    source "$PLAYWRIGHT_BASH_PROFILE"
  fi
}

if [ -f "$HOME/playwright/shell/.generated_commands.sh" ]
then
  source "$HOME/playwright/shell/.generated_commands.sh"
  echo 'Playwright has sourced your plays successfully!'
else
  echo 'Failed to source plays!'
fi