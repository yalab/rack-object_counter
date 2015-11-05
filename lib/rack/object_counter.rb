require "rack/object_counter/version"

module Rack
  class ObjectCounter
    LABEL = "[ObjectCounter]"
    def initialize(app)
      @app = app
    end

    def call(env)
      GC.disable
      before = ObjectSpace.count_objects({})
      app = @app.call(env)
      after = ObjectSpace.count_objects({})
      after.each { |k,v| after[k] = v - before[k] }
      @@logger.info %(#{LABEL} #{env["REQUEST_METHOD"]} #{env["PATH_INFO"]} #{after})
      GC.enable
      app
    end

    def self.logger=(logger, verbose: false)
      @@logger = logger
      @@verbose = verbose
    end
  end
end
