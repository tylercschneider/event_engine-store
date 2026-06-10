module EventEngine
  module Store
    class Recorder
      def call(event)
        StoredEvent.create!(
          event_name: event.event_name,
          event_type: event.event_type,
          event_version: event.event_version,
          process_type: event.process_type,
          payload: event.payload,
          metadata: event.metadata,
          occurred_at: event.occurred_at,
          idempotency_key: event.idempotency_key,
          aggregate_type: event.aggregate_type,
          aggregate_id: event.aggregate_id,
          aggregate_version: event.aggregate_version
        )
      end
    end
  end
end
