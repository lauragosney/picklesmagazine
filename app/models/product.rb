class Product < ApplicationRecord

  has_many :order_items
  has_many :product_variants
  accepts_nested_attributes_for :product_variants

  validates :title, presence: true
  validates :price_in_pounds, presence: true
  validates :description, presence: true
  validates :quote, presence: true
  validates :quote_credit, presence: true

  mount_uploader :image_1, ProductImageUploader
  mount_uploader :image_2, ProductImageUploader
  mount_uploader :image_3, ProductImageUploader
  mount_uploader :image_4, ProductImageUploader
  mount_uploader :image_5, ProductImageUploader
  mount_uploader :image_6, ProductImageUploader

  def to_param
    id.to_s + "-" + title.parameterize
  end

  def price_in_pounds
    price/100.00
  end

  def price_in_pounds=(pounds)
    self.price = (pounds.to_f * 100).round
  end

end
