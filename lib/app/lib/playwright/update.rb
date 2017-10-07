module Playwright
  module Commands
    class Update

      def self.run
        new.run
      end

      def initialize
      end

      def run
        `cd ~/playwright/.src; git reset --hard HEAD; git pull origin master; sh installer.sh "$PLAYWRIGHT_BASH_PROFILE"`
        Playwright::Commands::Apply.run
      end

    end
  end
end