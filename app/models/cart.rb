class Cart < ApplicationRecord
  has_many :order_items

  def total_quantity

    @count = 0

    order_items.all.each do |item|

      @count = @count + item.quantity

    end

    @count

  end

  def price_in_pounds
    total_price/100.00
  end

  def total_price

    @total = 500

    # if ["United States", "Canada"].include? self.country do
    #   @total += 1000
    # end
    # else
    #   @total += 500
    # end


    order_items.all.each do |item|
      @total = @total + item.product.price * item.quantity
    end
      @total

  end

  def total_price_in_pounds
    @total = 0

    order_items.all.each do |item|
      @total = @total + item.product.price_in_pounds * item.quantity
    end
      @total

  end
end
