Rails.application.routes.draw do
  mount EventEngine::Store::Engine => "/event_engine-store"
end
