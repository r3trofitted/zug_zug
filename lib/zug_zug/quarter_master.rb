require "zug_zug/soundboard"

module ZugZug
  class QuarterMaster
    def initialize(faction = HORDE)
      @soundboard = Soundboard.new(faction)
    end

    def checked_out!(argv)
      previous_head, new_head, branch_flag = argv
      
      if branch_flag == "1" && new_head == previous_head
        @soundboard.work_starts
      end
    end
    
    def merged!(argv)
      @soundboard.work_is_over
    end
  end
end
