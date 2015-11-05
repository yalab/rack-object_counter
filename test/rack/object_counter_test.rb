require 'test_helper'
require 'logger'

class Rack::ObjectCounterTest < Minitest::Test
  include Rack::Test::Methods
  class Logger
    def initialize(*args)
    end

    def info(msg=nil)
      if msg
        @info = msg
      else
        @info
      end
    end
  end

  def test_that_it_has_a_version_number
    refute_nil ::Rack::ObjectCounter::VERSION
  end

  def app
    Rack::Builder.parse_file(File.expand_path('../../config.ru', __FILE__)).first
  end

  def setup
    @logger = Logger.new(STDOUT)
    ::Rack::ObjectCounter.logger = @logger
    GC.start
  end

  def test_logging_normal
    get "/"
    assert last_response.ok?
    assert_match /:T_STRING=>30/, @logger.info
  end

  def test_logging_normal_increase
    get "/increase"
    assert_match /:T_STRING=>103/, @logger.info
  end
end
