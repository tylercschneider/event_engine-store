module EventEngine
  module Store
    class StoredEvent < ApplicationRecord
      self.table_name = "event_engine_store_stored_events"
    end
  end
end
