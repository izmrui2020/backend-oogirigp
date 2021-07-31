Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :oogiris
      resource :users, only: [:index, :show, :updata, :destroy]
    end
  end
end
