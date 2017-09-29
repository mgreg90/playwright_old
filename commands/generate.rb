module Playwright
  module Commands
    class Generate

      include Playwright::Utils
      include Playwright::Variables

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

      def file_name
        to_snake_case(command_name)
      end

      def run
        build_directories
        touch_files
        build_config
        build_template
        git_init
        open_editor
        puts "Built successfully!"
      end

      def build_directories
        `mkdir -p #{directories.join(' ')}`
      end

      def touch_files
        `touch #{files.join(' ')}`
      end

      def build_config
        File.open(config_file_path, 'w+') do |file|
          file.puts(config_file)
        end
      end

      def build_template
        Playwright::FileBuilder.build(type, file_name, *args)
      end

      def git_init
        `cd #{play_path}; git init -q`
      end

      def open_editor
        `$EDITOR #{play_path}`
      end

      def play_path
        "#{PLAYS_PATH}/#{file_name}"
      end

      def config_file_path
        "#{play_path}/config.json"
      end

      def directories
        [
          "#{play_path}/lib/#{file_name}"
        ]
      end

      def files
        [
          "#{play_path}/lib/#{file_name}.rb",
          "#{play_path}/Gemfile",
          "#{play_path}/lib/#{file_name}/subclass.rb",
          config_file_path
        ]
      end

      def config_file
        JSON.pretty_generate(
          command_name: command_name,
          file_name:    file_name
        )
      end

    end
  end
end