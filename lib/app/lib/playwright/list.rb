module Playwright
  module Commands
    class List

      include Playwright::Utils
      include Playwright::Variables

      GENERATED_COMMANDS_FILE = File.join(SHELL_PATH, '.generated_commands.sh')

      def self.run
        new.run
      end

      def initialize
      end

      def run
        puts plays.any? ? "You have the following plays available:" : "You haven't applied any plays!"
        plays.sort.each_with_index do |play, idx|
          puts "#{idx + 1}.\t#{play}"
        end
      end

      def plays
        File.foreach(GENERATED_COMMANDS_FILE).map do |line|
          line = line.strip
          if line.include?('alias') && line.include?('playwright_script')
            line.split('=').first.split('alias ')[1]
          end
        end.compact
      end

    end
  end
end