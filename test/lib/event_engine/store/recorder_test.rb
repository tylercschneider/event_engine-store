require "test_helper"

module EventEngine
  module Store
    class RecorderTest < ActiveSupport::TestCase
      test "records a dispatched event into the store" do
        event = EventEngine::Event.new(event_name: :order_placed, event_level: 3, payload: { "total" => 99 }, occurred_at: Time.current)

        Recorder.new.call(event)

        assert_equal 1, StoredEvent.count
      end
    end
  end
end
