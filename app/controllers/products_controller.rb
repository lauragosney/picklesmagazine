class ProductsController < ApplicationController

  def index
    @products = Product.order('created_at DESC')
  end

  def show
    @featured_products = Product.where(is_featured: true).order('created_at DESC')

    @product = Product.find(params[:id])

    # to let you add multi variants, ive commented it out
    # @order_item = @current_cart.order_items.find_by(product: @product)

    if @order_item.nil?
     @order_item = @current_cart.order_items.new(product: @product, quantity: 1)
   end
 end

end
