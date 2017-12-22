class OrderItemsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])

    @quantity = form_params[:quantity]
    @variant = form_params[:product_variant_id]
    
    @current_cart.order_items.create(product: @product, quantity: @quantity, product_variant_id: @variant)

    flash[:success] = "Item added to cart"

    redirect_to product_path(@product)
  end

  def update
    @product = Product.find(params[:product_id])

    @order_item = OrderItem.find(params[:id])

    @order_item.update(form_params)

    flash[:success] = "Cart updated"

    redirect_to product_path(@product)
  end

  def form_params
    params.require(:order_item).permit(:quantity, :product_variant_id)
  end

end
