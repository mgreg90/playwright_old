module Playwright
  module Variables
    
    HOME = ENV['HOME'].freeze
    INSTALL_PATH = "#{HOME}/playwright".freeze
    PLAYS_PATH = File.join(INSTALL_PATH, 'plays').freeze
    SHELL_PATH = File.join(INSTALL_PATH, 'shell').freeze
    COMMANDS_PATH = File.join(INSTALL_PATH, '.src', 'commands')
    LIB_PATH = File.join(INSTALL_PATH, '.src', 'lib')
    TEMPLATES_PATH = File.join(INSTALL_PATH, '.src', 'lib', 'templates')
    BASH_PROF = ENV['PLAYWRIGHT_BASH_PROFILE'].freeze
    BASH_LINES = [
      "# Source playwright ruby scripting framework".freeze,
      "export SOURCE_PLAYWRIGHT=\"/Users/mgregory/playwright/.src/playwright.sh\"".freeze,
      "export PLAYWRIGHT_BASH_PROFILE=\"/Users/mgregory/.zshrc\"".freeze,
      "source \"/Users/mgregory/playwright/.src/playwright.sh\"".freeze
    ].freeze
    
  end
end