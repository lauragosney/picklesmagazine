class Order < ApplicationRecord
  has_many :order_items

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :country, presence: true

  accepts_nested_attributes_for :order_items


  def add_from_cart(cart)
    cart.order_items.all.each do |item|
      self.order_items.new(product: item.product, product_variant: item.product_variant, quantity: item.quantity)
    end
  end

  def total
    @count = 0
    self.order_items.each do |item|
      @count += item.quantity
    end
    @count
  end

end
