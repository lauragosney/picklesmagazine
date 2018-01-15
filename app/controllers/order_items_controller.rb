class OrderItemsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])

    @quantity = form_params[:quantity]
    @variant_id = form_params[:product_variant_id]


    if @variant_id.present?
      @variant = ProductVariant.find(@variant_id)
    else
      @variant = nil
    end


    if @product.is_sold_out? or (@variant.present? and @variant.is_sold_out?)
      flash[:error] = "This product is sold out"
      redirect_to product_path(@product)
    else
      flash[:success] = "Item added to cart"
      redirect_to product_path(@product)
      @current_cart.order_items.create(product: @product, quantity: @quantity, product_variant_id: @variant_id)
    end


  end

  def update
    @product = Product.find(params[:product_id])

    @order_item = OrderItem.find(params[:id])

    @order_item.update(form_params)

    flash[:success] = "Cart updated"

    redirect_to cart_path
  end

  def destroy
    @product = Product.find(params[:product_id])

    @order_item = OrderItem.find(params[:id])

    @order_item.delete

    flash[:success] = "Product removed from cart"

    redirect_to cart_path

  end

  def form_params
    params.require(:order_item).permit(:quantity, :product_variant_id)
  end

end
