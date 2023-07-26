Rails.application.routes.draw do
  get 'gallery/index'
  resources :stores
  get 'admin/login'
  post 'admin/login'
  get 'admin/logout'
  get 'admin/log'
  get 'gallery/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
