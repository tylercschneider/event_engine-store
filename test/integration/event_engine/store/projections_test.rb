require "test_helper"

module EventEngine
  module Store
    class ProjectionsTest < ActiveSupport::TestCase
      class CollectingProjection
        attr_reader :applied

        def initialize
          @applied = []
        end

        def apply(event)
          @applied << event.event_name
        end
      end

      teardown do
        EventEngine::Store.reset_projections!
      end

      test "applies a dispatched event to a registered projection" do
        projection = CollectingProjection.new
        EventEngine::Store.register_projection(projection)

        EventEngine.dispatch(
          EventEngine::Event.new(event_name: :order_placed, event_level: 3, payload: {}, occurred_at: Time.current)
        )

        assert_equal [ :order_placed ], projection.applied
      end

      test "rebuilds a projection by replaying the stored log" do
        StoredEvent.create!(event_name: "a", occurred_at: Time.current)
        StoredEvent.create!(event_name: "b", occurred_at: Time.current)
        projection = CollectingProjection.new

        EventEngine::Store.rebuild(projection)

        assert_equal [ "a", "b" ], projection.applied
      end
    end
  end
end
