class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @featured_products = Product.where(is_featured: true)

    @product = Product.find(params[:id])

    @order_item = @current_cart.order_items.find_by(product: @product)

    if @order_item.nil?
     @order_item = @current_cart.order_items.new(product: @product, quantity: 1)

   end
 end

end
