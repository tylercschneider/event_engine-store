require "test_helper"

module EventEngine
  module Store
    class StoredEventTest < ActiveSupport::TestCase
      test "persists a recorded event" do
        stored = StoredEvent.create!(event_name: "order_placed", occurred_at: Time.current)

        assert stored.persisted?
      end
    end
  end
end
