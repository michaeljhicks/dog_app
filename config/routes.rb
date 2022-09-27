Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :owners, only: %i[index show update destroy]
      resources :dogs, only: %i[index show update destroy]
    end 
  end 
end
