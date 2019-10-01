require "zug_zug"

module ZugZug
  class Soundboard
    HORDE_SOUNDS = {
      zug_zug: "zug_zug.wav",
      work_complete: "work_complete.wav"
    }
    
    ALLIANCE_SOUNDS = {
      zug_zug: "alright.wav",
      work_complete: "jobs_done.wav"
    }
    
    def self.board_for(faction)
      case faction
      when HORDE
        HORDE_SOUNDS
      when ALLIANCE
        ALLIANCE_SOUNDS
      else
        fail ArgumentError, "#{faction} is not a valid faction (valid factions are #{HORDE} and #{ALLIANCE})"
      end
    end
    
    def initialize(faction, plugin: default_plugin)
      @_board  = Soundboard.board_for faction
      @_plugin = plugin
    end
  
    def work_starts
      play sound_file(:zug_zug)
    end
  
    def work_is_over
      play sound_file(:work_complete)
    end
  
    def play(file)
      @_plugin.call(file)
    end
    
    def sound_file(sound)
      file_name = @_board.fetch sound
      File.join __dir__, "sounds", file_name
    end
    
    private
    
    def default_plugin
      if RUBY_PLATFORM.include? "x86_64-darwin"
        ->(file) { system "afplay", file }
      else
        ->(file) { true }
      end
    end
  end
end
