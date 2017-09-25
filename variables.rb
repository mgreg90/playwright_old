module Playwright
  module Variables
    
    INSTALL_PATH = "~/playwright".freeze
    HOME = ENV['HOME'].freeze
    BASH_PROF = ENV['PLAYWRIGHT_BASH_PROFILE'].freeze
    BASH_LINES = [
      "# Source playwright ruby scripting framework",
      "export SOURCE_PLAYWRIGHT=\"/Users/mgregory/playwright/.src/playwright.sh\"",
      "export PLAYWRIGHT_BASH_PROFILE=\"/Users/mgregory/.zshrc\"",
      "source \"/Users/mgregory/playwright/.src/playwright.sh\""
    ]
    
  end
end