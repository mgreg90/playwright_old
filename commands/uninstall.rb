module Playwright
  module Commands
    class Uninstall
      
      def self.run
        new.run
      end
      
      def run
        remove_files
        remove_sourcing
        puts "Playwright Uninstalled!"
      end
      
      def remove_files
        playwright_path = Dir.glob("#{Playwright::Variables::HOME}/playwright")
        FileUtils.rm_rf(playwright_path)
      end
      
      def remove_sourcing
        bash_prof = Playwright::Variables::BASH_PROF
        
        # temp file will be used to rebuild bash profile without my lines
        temp_file = File.join(File.expand_path('..', bash_prof), 'playwright_temp_bash_prof')
        
        # create a backup
        FileUtils.cp(bash_prof, "#{bash_prof}.bak")
        
        # loop thru the bash profile, writing to the temp_file unless it's from playwright
        File.open(temp_file, 'w') do |output_file|
          File.foreach(bash_prof) do |line|
            output_file.puts line unless remove_line?(line)
          end
        end
        
        # overwrite old bash profile with new bash profile.
        FileUtils.mv(temp_file, bash_prof)
      end
      
      def remove_line?(line)
        Playwright::Variables::BASH_LINES.each do |bash_line|
          return true if bash_line.strip.downcase == line.strip.downcase
        end
        false
      end
      
    end
  end
end