Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products do
    resources :order_items
  end

  resource :newsletter

  resources :orders

  resources :stories

  resource :cart

  root "pages#home"

  get "privacypolicy", to: "pages#privacypolicy"

  get "about", to: "pages#about"

  get "contact", to: "pages#contact"


end
