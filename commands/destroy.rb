module Playwright
  module Commands
    class Destroy

      include Playwright::Utils

      attr_reader :type, :command_name

      def self.run(*args)
        args = args.flatten
        new(args[0], args[1], *args[2..-1]).run
      end

      def initialize(type, command_name, *args)
        @type = type.to_sym
        @command_name = to_snake_case(command_name)
      end

      def run
        case type
        when :play
          FileUtils.rm_rf(File.join(Playwright::Variables::PLAYS_PATH, command_name))
        end
        puts "Destroyed successfully!"
      end

    end
  end
end