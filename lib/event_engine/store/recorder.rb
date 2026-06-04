module EventEngine
  module Store
    class Recorder
      def call(event)
        StoredEvent.create!(event_name: event.event_name)
      end
    end
  end
end
