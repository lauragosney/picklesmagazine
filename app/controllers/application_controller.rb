class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_splash_screen
  before_action :current_cart
  helper_method :current_cart


  def current_cart
    if session[:cart_id].present?
      @current_cart = Cart.find(session[:cart_id])
    else
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  rescue ActiveRecord::RecordNotFound
    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id
  end

  def check_splash_screen
    if session[:shown_splash] == "yep"
      @show_splash = false
    else
      @show_splash = true
      session[:shown_splash] = "yep"
    end
  end
  
end
