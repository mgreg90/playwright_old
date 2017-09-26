module Playwright
  module Commands
    class Generate
      
      attr_reader :type, :command_name, :args
      
      def self.run(*args)
        args = args.flatten
        new(args[0], args[1], *args[2..-1]).run
      end
      
      def initialize(type, command_name, *args)
        @type = type.to_sym
        @command_name = command_name
        @args = args
      end
      
      def run
        Playwright::FileBuilder.build(type, command_name, *args)
        puts "Built successfully!"
      end
            
    end
  end
end