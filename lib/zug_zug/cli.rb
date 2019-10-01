require "thor"

module ZugZug
  class CLI < Thor
    include Thor::Actions
    
    desc "join FACTION", "install the FACTION git hooks"
    def join(faction)
      FileUtils.chmod 0751, template("post_checkout", ".git/hooks/post-checkout", faction: faction)
      FileUtils.chmod 0751, template("post_merge", ".git/hooks/post-merge", faction: faction)
      
      puts "You are now part of the #{faction}!"
    end
    
    def self.source_root
      File.join __dir__, "templates"
    end
  end
end
