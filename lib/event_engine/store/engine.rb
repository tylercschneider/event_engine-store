module EventEngine
  module Store
    class Engine < ::Rails::Engine
      isolate_namespace EventEngine::Store

      initializer "event_engine.store.register_recorder" do
        config.after_initialize do
          EventEngine.register_handler(Recorder.new, levels: :all)
        end
      end
    end
  end
end
