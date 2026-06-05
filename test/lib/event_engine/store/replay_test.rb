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
    end
  end
end
