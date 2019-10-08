class StoriesController < ApplicationController

  def index
   @category_id = params[:category]

   if @category_id.present?
      @category = Category.find_by(title: @category_id)
      @stories = @category.stories.all.order('created_at DESC')
   else
      @stories = Story.order('created_at DESC')
   end


   # if params[:q].present?
   #   @stories = Story.where("lower(title) LIKE ?", "%" + params[:q].downcase + "%")
   # else
   #   @stories = Story.all
   # end

  end


  def show
    @story = Story.find(params[:id])
  end


end
