Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount Rswag::Ui::Engine => '/docs'
      mount Rswag::Api::Engine => '/docs'
      # detatched routes
      post '/login', to: 'sessions#create'

      # resourceful routes
      resources :posts do
        resources :comments
      end
      resources :users
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
