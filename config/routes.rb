Rails.application.routes.draw do  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get 'pages/home', to: 'pages#home'

  get 'welcome', to: 'welcome#index'
end
