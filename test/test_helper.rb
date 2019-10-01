$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "zug_zug"

require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new
