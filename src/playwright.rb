# include everything
require_relative './playwright/installer.rb'

class Playwright
  
  def self.install(bp_path)
    Installer.install(bp_path)
  end
  
end