module Playwright
  module Commands
    class Apply

      include Playwright::Utils
      include Playwright::Variables
      
      GENERATED_COMMANDS_FILE = File.join(SHELL_PATH, '.generated_commands.sh')

      attr_accessor :lines

      def self.run
        new.run
      end

      def initialize
        @lines = [
          "#!/bin/bash",
          '',
          'function playwright_script() {',
          "\truby \"$HOME/playwright/plays/$1\" \"$@\"",
          '}',
          ''
        ]
      end

      def run
        @lines << Dir["#{Playwright::Variables::PLAYS_PATH}/*"].map do |filepath|
          command_from_string(File.basename(filepath, '.rb'))
        end
        @lines.flatten!

        FileUtils.touch(GENERATED_COMMANDS_FILE)
        File.open(GENERATED_COMMANDS_FILE, 'w+') do |file|
          file.puts(lines)
        end
        puts "Your plays have been applied! Please restart this terminal."
      end

      def command_from_string(string)
        # string should be snake case
        "alias #{string}=\"playwright_script #{string}.rb\""
      end

    end
  end
end