Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy, :new]
  devise_for :users
  root 'users#my_portfolio'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
