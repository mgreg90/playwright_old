module Playwright
  module Commands
    class Edit < Playwright::Play

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
        open_editor
      end

      def play_name
        params.play_name[-5..-1] == '_play' ? params.play_name : (params.play_name + '_play')
      end

      def path
        "#{PLAYS_PATH}/#{play_name}"
      end

      def open_editor
        puts "Launching #{params.play_name} in your editor..."
        `$EDITOR #{path}`
      end

    end
  end
end