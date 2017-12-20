class OrderItemsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])

    @quantity = form_params[:quantity]

    @size = form_params[:product_variant_id]


    @current_cart.order_items.create(product: @product, quantity: @quantity, product_variant_id: @size )

    redirect_to product_path(@product)
  end

  def form_params
    params.require(:order_item).permit(:quantity, :product_variant_id)
  end

end
