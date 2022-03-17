Rails.application.routes.draw do
  resources :courses do
    resources :topics
  end
  root 'courses#index'

  get 'pages/home', to: 'courses#index'
  devise_for :users

  get '/profile', to: 'users#profile'
  patch '/profile', to: 'users#update_profile_pic'
  put '/profile', to: 'users#update_profile_pic'

  get '/topics/list', to: 'topics#list'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
