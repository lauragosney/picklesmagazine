class PagesController < ApplicationController

  def home
    @featured_products = Product.where(is_featured: true)
    @featured_stories = Story.where(is_featured: true)

    @product_launch = Product.find(8)

    @product_mag = Product.find(3)



  end

  def about
  end

  def contact
  end

end
