Rails.application.routes.draw do
  resources :words
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "words#index"
end
