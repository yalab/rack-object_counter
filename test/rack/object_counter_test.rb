require 'test_helper'

class Rack::ObjectCounterTest < Minitest::Test
  include Rack::Test::Methods
  def test_that_it_has_a_version_number
    refute_nil ::Rack::ObjectCounter::VERSION
  end

  def app
    TestApp.new
  end

  def test_redirect_logged_in_users_to_dashboard
    get "/"
    assert last_response.ok?
  end
end
