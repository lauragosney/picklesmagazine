class OrderItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :cart, optional: true

  belongs_to :product
  belongs_to :product_variant
end
