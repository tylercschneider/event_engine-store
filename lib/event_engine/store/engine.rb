module EventEngine
  module Store
    class Engine < ::Rails::Engine
      isolate_namespace EventEngine::Store
    end
  end
end
