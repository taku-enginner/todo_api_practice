Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  
  namespace :api do
    namespace :v1 do
      resources :sessions, only: %i[create destroy]
      resources :tasks
      namespace :admin do
        resources :users
      end
    end
  end

end
