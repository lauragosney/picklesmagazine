class CategoryStory < ApplicationRecord
  belongs_to :story
  belongs_to :category

  def to_param
    id.to_s + "-" + title.parameterize
  end

end
