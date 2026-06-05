require "event_engine/store/version"
require "event_engine/store/engine"
require "event_engine/store/recorder"
require "event_engine/store/replay"
require "event_engine/store/projection_dispatcher"

module EventEngine
  module Store
    class << self
      def projections
        @projections ||= []
      end

      def register_projection(projection)
        projections << projection
      end

      def reset_projections!
        projections.clear
      end
    end
  end
end
