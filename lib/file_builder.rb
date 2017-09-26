require_relative '../variables.rb'
require_relative './utils.rb'

module Playwright
  class FileBuilder
    
    include Playwright::Variables
    include Playwright::Utils
    
    PLAY_NAME_PLACEHOLDER = '**PLAY_NAME**'.freeze
    DEF_ARGS_PLACEHOLDER = '**DEF_ARGS**'.freeze
    CALL_ARGS_PLACEHOLDER = '**CALL_ARGS**'.freeze
    SET_VARS_FROM_ARGS_PLACEHOLDER = '**SET_VARS_FROM_ARGS**'.freeze
    
    TEMPLATE_FOLDER = 'templates'.freeze
    PLAY_TEMPLATE_FILENAME = 'play.rb.sample'.freeze
    
    PLAY_DEST_PATH = 'plays'.freeze
    
    attr_reader :type, :args
    
    def self.build(type, name, *args)
      inst = new(type, name, *args)
      inst.build
      inst
    end
    
    def initialize(type, name, *args)
      # name should be snake case
      @type = type.to_sym
      @name = to_snake_case(name)
      @args = args
    end
    
    def name(name_case=:snake)
      case name_case
      when :snake
        @name
      when :pascal
        @name.split('_').map(&:capitalize).join
      else
        raise ArgumentError
      end
    end
    
    def build
      send("build_#{type}")
      true
    end
    
    def template
      case type
      when :play
        File.join(HOME, 'playwright', '.src', 'lib', TEMPLATE_FOLDER, PLAY_TEMPLATE_FILENAME)
      end
    end
    
    def dest_file
      case type
      when :play
        File.join(HOME, 'playwright', PLAY_DEST_PATH, "#{name}.rb")
      end
    end
    
    def build_play
      p dest_file
      p FileUtils.pwd
      FileUtils.touch(dest_file)
      # loop template and build new file with map
      File.open(dest_file, 'w') do |output_file|
        File.foreach(template) do |line|
          output_file.puts write_line(line)
        end
      end
    end
    
    def write_line(line)
      # get placeholder in line
      selected_ph = play_map.keys.find { |placeholder| line.include?(placeholder)}
      selected_ph ? line.gsub(selected_ph, play_map[selected_ph]) : line
    end
        
    def play_map
      @play_mape ||= {
        PLAY_NAME_PLACEHOLDER => name(:pascal),
        DEF_ARGS_PLACEHOLDER => def_args,
        CALL_ARGS_PLACEHOLDER => call_args,
        SET_VARS_FROM_ARGS_PLACEHOLDER => set_vars_from_args
      }
    end
    
    def def_args
      "(#{args.join(', ')})"
    end
    
    def call_args
      # set up this way because this will change when we support optional args
      def_args
    end
    
    def set_vars_from_args
      args.map { |arg| "@#{arg} = #{arg}" }.join("\n\t\t")
    end
    
  end
end