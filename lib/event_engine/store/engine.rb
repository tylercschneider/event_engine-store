module EventEngine
  module Store
    class Engine < ::Rails::Engine
      isolate_namespace EventEngine::Store

      initializer "event_engine.store.register_recorder" do
        config.after_initialize do
          EventEngine.register_handler(Recorder.new, process_types: :all)
          EventEngine.register_handler(ProjectionDispatcher.new, process_types: :all)
        end
      end
    end
  end
end
