class ProductVariant < ApplicationRecord
  belongs_to :product

  validates :size, presence: true
  validates :rank, presence: true
  validates :product_id, presence: true

end
