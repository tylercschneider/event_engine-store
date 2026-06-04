module EventEngine
  module Store
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
