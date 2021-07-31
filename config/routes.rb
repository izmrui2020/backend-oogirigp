Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      
      namespace :users do 
        get     :check
        put     :edit
        delete  :destroy
      end
    
      resources :oogiris
    end
  end
end
