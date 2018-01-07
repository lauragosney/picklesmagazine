class Order < ApplicationRecord
  has_many :order_items

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :country, presence: true

  accepts_nested_attributes_for :order_items

  before_save :update_delivery_address

  def update_delivery_address
    if self.subscribe?
      self.delivery_first_name = self.first_name
      self.delivery_last_name = self.last_name
      self.delivery_address_1 = self.address_1
      self.delivery_city = self.city
      self.delivery_country = self.country
    end
  end


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

  def save_and_charge
    if self.valid?

      Stripe::Charge.create(amount: self.total_price, currency: "gbp",
        source: self.stripe_token, description: "Order for" + self.email)

        self.save
    else
      false
    end

  rescue Stripe::CardError => e
    @message = e.json_body[:error][:message]

    self.errors.add(:stripe_token, @message)

    false

  end

  def price_in_pounds
    total_price/100.00
  end


  def total_price

    @total = 0

    if ["United States", "Canada"].include? self.country do
      @total += 1000
    end
    else
      @total += 500
    end


    order_items.each do |item|
      @total = @total + item.product.price * item.quantity
    end
    @total
  end



end
