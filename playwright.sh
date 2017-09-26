#!/bin/bash

playwright() {
  ruby ~/playwright/.src/commands.rb "$@"
}

if [ -f "$HOME/playwright/shell/.generated_commands.sh" ]
then
  source "$HOME/playwright/shell/.generated_commands.sh"
  echo 'Playwright has sourced your plays successfully!'
else
  echo 'Failed to source plays!'
fi