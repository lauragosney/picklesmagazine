class OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.add_from_cart(@current_cart)
  end


  def create
    @order = Order.new(form_params)
    @order.add_from_cart(@current_cart)

    if @order.save_and_charge
      reset_session

      flash[:success] = "Order completed"

      redirect_to order_path(@order)

    else
      render "new"
    end
  end


  def form_params
    params.require(:order).permit(:first_name, :last_name, :email, :country, :address_1,
    :address_2, :city, :postal_code, :stripe_token, :delivery_first_name, :delivery_last_name,
    :delivery_address_1, :delivery_address_2, :delivery_city, :delivery_country, :delivery_postal_code, :subscribe)
  end

  def show
    @order = Order.find(params[:id])
  end

end
