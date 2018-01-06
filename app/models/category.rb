class Category < ApplicationRecord

  has_many :category_stories
  has_many :stories, through: :category_stories

  validates :title, presence: true
end
