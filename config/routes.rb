Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/api/v1/recipes', to: "recipes#index"
  get '/api/v1/learning_resources', to: "learning_resources#show"
  get '/api/v1/tourist_sights', to: "tourist_sights#index"
  post '/api/v1/users', to: "users#create"
  post '/api/v1/favorites', to: "favorites#create"
end
