class PagesController < ApplicationController

  def home
    @featured_products = Product.where(is_featured: true).order('created_at DESC')
    @featured_stories = Story.where(is_featured: true).order('created_at DESC')

    @product_launch1 = Product.where(on_homepage: true).last
    @product_launch2 = Product.where(on_homepage_slottwo: true).last

    @story_launch = Story.where(on_homepage: true).last






  end

  def about
  end

  def contact
  end

end
