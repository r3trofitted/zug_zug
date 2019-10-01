require "test_helper"
require "zug_zug/soundboard"

module ZugZug
  class SoundboardTest < Minitest::Test
    def test_it_needs_a_valid_faction
      assert_raises(ArgumentError, "empire is not a valid faction") { Soundboard.new :empire }
      assert Soundboard.new :horde
    end
  
    def test_playing_through_a_plugin
      @plugin_called = false
      
      sb = Soundboard.new :horde, plugin: ->(file) { @plugin_called = true }
      sb.play "example.wav"
      
      assert @plugin_called
    end
    
    def test_horde_sound_files
      sb = Soundboard.new :horde, plugin: ->(file) { true }
      
      assert_match %r{sounds/zug_zug.wav\Z}, sb.sound_file(:zug_zug)
      assert_match %r{sounds/work_complete.wav\Z}, sb.sound_file(:work_complete)
    end
    
    def test_alliance_sound_files
      sb = Soundboard.new :alliance, plugin: ->(file) { true }
      
      assert_match %r{sounds/alright.wav\Z}, sb.sound_file(:zug_zug).force_encoding('UTF-8')
      assert_match %r{sounds/jobs_done.wav\Z}, sb.sound_file(:work_complete).force_encoding('UTF-8')
    end
  end
end
