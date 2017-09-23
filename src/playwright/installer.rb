class Playwright
  class Installer
    
    def self.install(bp_path)
      new(bp_path)
    end
    
    def initialize(bp_path)
      @bp_path = bp_path
      `cat #{bp_path}`
    end
    
  end
end