class Story < ApplicationRecord

  has_many :category_stories
  has_many :categories, through: :category_stories
  has_many :category_stories, dependent: :delete_all

  validates :title, presence: true
  validates :byline, presence: true
  validates :body, presence: true
  validates :credit, presence: true
  validates :categories, presence: true


  mount_uploader :image_1, StoryImageUploader
  mount_uploader :image_2, StoryImageUploader
  mount_uploader :image_3, StoryImageUploader
  mount_uploader :image_4, StoryImageUploader
  mount_uploader :image_5, StoryImageUploader

  def to_param
    id.to_s + "-" + title.parameterize
  end

end
