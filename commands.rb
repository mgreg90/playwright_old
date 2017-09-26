require 'FileUtils'

require_relative './lib/utils.rb'
require_relative './lib/file_builder.rb'

require_relative './variables.rb'
require_relative './commands/generate.rb'
require_relative './commands/uninstall.rb'

module Playwright
  module Commands
    
    def self.uninstall(argv)
      Uninstall.run
    end
    
    def self.generate(argv)
      Generate.run(argv)
    end
    def self.g(argv); self.generate(argv); end
    
  end
end

if ARGV.empty?
  puts "Error! Invalid Script!"
else
  Playwright::Commands.send(ARGV[0].downcase, ARGV[1..-1])
end