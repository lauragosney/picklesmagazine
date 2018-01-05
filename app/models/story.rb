class Story < ApplicationRecord

  validates :title, presence: true
  validates :byline, presence: true
  validates :body, presence: true
  validates :credit, presence: true

  mount_uploader :image_1, StoryImageUploader
  mount_uploader :image_2, StoryImageUploader
  mount_uploader :image_3, StoryImageUploader
  mount_uploader :image_4, StoryImageUploader
  mount_uploader :image_5, StoryImageUploader

end
