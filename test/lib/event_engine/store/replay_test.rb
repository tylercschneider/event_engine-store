require "test_helper"

module EventEngine
  module Store
    class ReplayTest < ActiveSupport::TestCase
      test "replays stored events in append order" do
        StoredEvent.create!(event_name: "first", occurred_at: Time.current)
        StoredEvent.create!(event_name: "second", occurred_at: Time.current)

        names = []
        Replay.each { |event| names << event.event_name }

        assert_equal [ "first", "second" ], names
      end

      test "reconstructs the full event from the record" do
        StoredEvent.create!(
          event_name: "order_placed",
          event_type: "domain",
          event_version: 2,
          event_level: 3,
          payload: { "total" => 99 },
          metadata: { "source" => "web" },
          occurred_at: Time.current,
          idempotency_key: "abc",
          aggregate_type: "Order",
          aggregate_id: "o-1",
          aggregate_version: 5
        )

        events = []
        Replay.each { |event| events << event }

        assert_equal(
          {
            event_name: "order_placed",
            event_type: "domain",
            event_version: 2,
            event_level: 3,
            payload: { "total" => 99 },
            metadata: { "source" => "web" },
            idempotency_key: "abc",
            aggregate_type: "Order",
            aggregate_id: "o-1",
            aggregate_version: 5
          },
          events.first.to_h.except(:occurred_at)
        )
      end
    end
  end
end
