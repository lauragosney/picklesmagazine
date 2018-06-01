class Event < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :price, presence: true
  validates :time, presence: true
  validates :venue, presence: true
  validates :more_information, presence: true

  mount_uploader :image, EventImageUploader


end
