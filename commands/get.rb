module Playwright
  module Commands
    class Get < Playwright::Play

      include Playwright::Utils
      include Playwright::Variables
      
      PARAMS_MAP = [:action]

      GENERATED_COMMANDS_FILE = File.join(SHELL_PATH, '.generated_commands.sh')

      def run
        response = HTTParty.get("#{SERVER_URL}/plays/#{params.action}.json").parsed_response
        # TODO: implement get with https (not just ssh)
        `cd ~/playwright/plays; git clone #{response['github_clone_ssh_url']}`
      end

    end
  end
end