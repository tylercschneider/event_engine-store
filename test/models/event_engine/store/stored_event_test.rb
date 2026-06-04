require "test_helper"

module EventEngine
  module Store
    class StoredEventTest < ActiveSupport::TestCase
      test "persists a recorded event" do
        stored = StoredEvent.create!(event_name: "order_placed", occurred_at: Time.current)

        assert stored.persisted?
      end

      test "cannot be updated once recorded" do
        stored = StoredEvent.create!(event_name: "order_placed", occurred_at: Time.current)

        assert_raises(ActiveRecord::ReadOnlyRecord) { stored.update!(event_version: 9) }
      end
    end
  end
end
