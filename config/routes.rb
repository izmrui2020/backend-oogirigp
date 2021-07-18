Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :oogiries
      resource :users
    end
  end
end
