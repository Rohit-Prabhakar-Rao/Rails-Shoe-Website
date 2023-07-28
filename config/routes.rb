Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'gallery/index'
  resources :stores
  get 'admin/login'
  post 'admin/login'
  get 'admin/logout'
  get 'admin/log'
  get 'gallery/contact'
  get 'gallery/products'
  get 'gallery/tracking'
  get 'gallery/index'
  get 'gallery/checkout'
  post 'gallery/checkout'
  get 'gallery/purchased'
  get 'gallery/search'
  post 'gallery/search'
  # post 'gallery/view_order/:order_id', to: 'gallery#view', as: :gallery_view_order

  devise_for :users
  root to: 'gallery#index'
  get 'gallery/view/:id', to: 'gallery#view', as: 'view_product_detail'
  post 'gallery/view/:id', to: 'gallery#view', as: 'post_view_product'
  get 'admin_login', to: 'admin_sessions#new'
  post 'admin_login', to: 'admin_sessions#create'
  get 'admin_logout', to: 'admin_sessions#delete'
end
