require "test_helper"

module EventEngine
  module Store
    class RecorderTest < ActiveSupport::TestCase
      test "records a dispatched event into the store" do
        event = EventEngine::Event.new(event_name: :order_placed, process_type: :durable, payload: { "total" => 99 }, occurred_at: Time.current)

        Recorder.new.call(event)

        assert_equal 1, StoredEvent.count
      end

      test "copies the event's attributes onto the record" do
        event = EventEngine::Event.new(
          event_name: :order_placed,
          event_type: :domain,
          event_version: 2,
          process_type: :durable,
          payload: { "total" => 99 },
          metadata: { "source" => "web" },
          idempotency_key: "abc",
          aggregate_type: "Order",
          aggregate_id: "o-1",
          aggregate_version: 5
        )

        Recorder.new.call(event)

        attrs = StoredEvent.last.attributes.slice(
          "event_name", "event_type", "event_version", "process_type",
          "payload", "metadata", "idempotency_key",
          "aggregate_type", "aggregate_id", "aggregate_version"
        )
        assert_equal(
          {
            "event_name" => "order_placed",
            "event_type" => "domain",
            "event_version" => 2,
            "process_type" => "durable",
            "payload" => { "total" => 99 },
            "metadata" => { "source" => "web" },
            "idempotency_key" => "abc",
            "aggregate_type" => "Order",
            "aggregate_id" => "o-1",
            "aggregate_version" => 5
          },
          attrs
        )
      end
    end
  end
end
