module EventEngine
  module Store
    module Replay
      def self.each
        StoredEvent.order(:id).find_each do |stored|
          yield EventEngine::Event.new(event_name: stored.event_name)
        end
      end
    end
  end
end
