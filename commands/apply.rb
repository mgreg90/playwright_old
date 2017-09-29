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
          "\truby \"$HOME/playwright/plays/$1/lib/$1.rb\" \"$@\"",
          '}',
          ''
        ]
      end

      def run
        @lines << Dir["#{Playwright::Variables::PLAYS_PATH}/*"].map do |filepath|
          command_from_config(file_config(filepath))
        end
        @lines.flatten!

        FileUtils.touch(GENERATED_COMMANDS_FILE)
        File.open(GENERATED_COMMANDS_FILE, 'w+') do |file|
          file.puts(lines)
        end
        puts "Your plays have been applied!"
      end

      def file_config(filepath)
        JSON.parse(File.read(File.join(filepath, 'config.json')))
      end

      def command_from_config(file_config)
        command_name = file_config['command_name']
        file_name = file_config['file_name']
        "alias #{command_name}=\"playwright_script #{file_name}\""
      end

    end
  end
end