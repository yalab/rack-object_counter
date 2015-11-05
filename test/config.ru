class TestApp
  def call(env)
    if env["PATH_INFO"] == "/increase"
      100.times do
        ""
      end
    end
    
    greeting = "hello"
    code   = 200
    body   = [ greeting ]
    header = { "Content-Type"           => "text/html;charset=utf-8",
               "Content-Length"         => greeting.length}
      [ code, header, body ]
  end
end
use Rack::ObjectCounter
run TestApp.new
