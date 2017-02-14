Rails.application.routes.draw do
  namespace :api do
    resources :posts
  end

  resources :posts
  resources :pages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
