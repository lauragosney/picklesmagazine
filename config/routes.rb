Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products do
    resources :order_items
  end

  resources :orders

  resource :cart

  root "pages#home"

  get "about", to: "pages#about"

  get "contact", to: "pages#contact"


end
