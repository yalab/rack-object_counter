$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rack/object_counter'

require 'minitest/autorun'
require 'rack/test'


class TestApp
  def call(env)
    greeting = "hello"
    code   = 200
    body   = [ greeting ]
    header = { "Content-Type"           => "text/html;charset=utf-8",
               "Content-Length"         => greeting.length}
      [ code, header, body ]
  end
end
