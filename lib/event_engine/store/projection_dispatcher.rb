module EventEngine
  module Store
    class ProjectionDispatcher
      def call(event)
        Store.projections.each { |projection| projection.apply(event) }
      end
    end
  end
end
