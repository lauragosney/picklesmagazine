class PagesController < ApplicationController

  def home
    @featured_products = Product.where(is_featured: true)
    @featured_stories = Story.where(is_featured: true)

    @product_launch = Product.where(on_homepage: true).last
    @story_launch = Story.where(on_homepage: true).last






  end

  def about
  end

  def contact
  end

end
