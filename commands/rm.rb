module Playwright
  module Commands
    class Rm < Playwright::Play

      include Playwright::Utils
      include Playwright::Variables

      PARAMS_MAP = [:play_name]
      VALIDATIONS = [
        {
          condition: proc { !params.play_name },
          message: "You must give a play name!"
        }, {
          condition: proc { !Dir.exist?(self.path) },
          message: "You don't have a play with that name!"
        }
      ]

      def run
        remove_play
      end

      def play_name
        params.play_name[-5..-1] == '_play' ? params.play_name : (params.play_name + '_play')
      end

      def path
        "#{PLAYS_PATH}/#{play_name}"
      end

      def remove_play
        puts "Removing #{params.play_name} in your editor..."
        FileUtils.rm_rf(path)
        puts "#{params.play_name} removed!"
      end

    end
  end
end