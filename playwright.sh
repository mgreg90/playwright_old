#!/bin/bash

playwright() {
  ruby ~/playwright/.src/commands.rb "$@"
}

if [ -f "$HOME/playwright/shell/.generated_commands.sh" ]
then
  source "$HOME/playwright/shell/.generated_commands.sh"
else
  echo 'Failed to source plays!'
fi