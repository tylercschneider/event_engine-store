require "test_helper"

class EventEngine::StoreTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert EventEngine::Store::VERSION
  end
end
