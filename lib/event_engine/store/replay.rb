module EventEngine
  module Store
    module Replay
      def self.each
        StoredEvent.order(:id).find_each do |stored|
          yield EventEngine::Event.new(
            event_name: stored.event_name,
            event_type: stored.event_type,
            event_version: stored.event_version,
            event_level: stored.event_level,
            payload: stored.payload,
            metadata: stored.metadata,
            occurred_at: stored.occurred_at,
            idempotency_key: stored.idempotency_key,
            aggregate_type: stored.aggregate_type,
            aggregate_id: stored.aggregate_id,
            aggregate_version: stored.aggregate_version
          )
        end
      end
    end
  end
end
