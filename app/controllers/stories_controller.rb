class StoriesController < ApplicationController

  def index
   @category_id = params[:category]

   if @category_id.present?
      @category = Category.find(@category_id)
      @stories = @category.stories.all
   else
      @stories = Story.all
   end
  end


  def show
    @story = Story.find(params[:id])
  end


end
