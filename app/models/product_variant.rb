class ProductVariant < ApplicationRecord

  belongs_to :product
  has_many :order_items

  validates :size, presence: true
  validates :rank, presence: true
  validates :product, presence: true

  def select_text
    str = size

    if is_sold_out?
      str +=  " (sold out)"
    end

    str
  end
end
