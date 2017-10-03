require 'rubygems'
require 'bundler'
Bundler.setup(:default)

# require 'FileUtils'
require 'json'
require 'httparty'
require 'pry'

require_relative './lib/utils.rb'
require_relative './lib/file_builder.rb'
require_relative './lib/arguments.rb'
require_relative './lib/params.rb'
require_relative './lib/play.rb'

require_relative './variables.rb'
require_relative './commands/apply.rb'
require_relative './commands/destroy.rb'
require_relative './commands/generate.rb'
require_relative './commands/get.rb'
require_relative './commands/list.rb'
require_relative './commands/update.rb'
require_relative './commands/uninstall.rb'

module Playwright
  module Commands

    def self.apply(argv)
      Apply.run
    end

    def self.destroy(argv)
      Destroy.run(argv)
    end
    def self.d(argv); self.destroy(argv); end

    def self.generate(argv)
      Generate.run(argv)
    end
    def self.g(argv); self.generate(argv); end

    def self.get(argv)
      Get.run(argv)
    end

    def self.list(argv)
      List.run
    end
    def self.l(argv); self.list(argv); end

    def self.uninstall(argv)
      Uninstall.run
    end

    def self.update(argv)
      Update.run
    end

  end
end

if ARGV.empty?
  puts "Error! Invalid Script!"
else
  Playwright::Commands.send(ARGV[0].downcase, ARGV[1..-1])
end