require "test_helper"

module EventEngine
  module Store
    class RecordsDispatchedEventsTest < ActiveSupport::TestCase
      test "records an event dispatched through EventEngine" do
        EventEngine.dispatch(
          EventEngine::Event.new(event_name: :order_placed, process_type: :durable, payload: {}, occurred_at: Time.current)
        )

        assert_equal 1, StoredEvent.count
      end
    end
  end
end
