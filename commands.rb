require 'FileUtils'

require_relative './variables.rb'
require_relative './commands/uninstall.rb'

module Playwright
  module Commands
    
    def self.uninstall
      Uninstall.run
    end
    
  end
end