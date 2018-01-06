ActiveAdmin.register Story do
  permit_params :title, :byline, :standfirst, :body, :image_1, :image_2, :image_3, :image_4, :image_5, :quote,
  :caption_1, :caption_2, :caption_3, :caption_4, :caption_5, :credit, :is_featured, category_ids:[]

   show do
     attributes_table do
      row :title
      row :byline
      row :standfirst
      row :credit
      row :image_1 do |story|
        image_tag story.image_1.thumb, width: "40"
      end
      row :caption_1
      row :body
      row :image_2 do |story|
        image_tag story.image_2.thumb, width: "40"
      end
      row :caption_2
      row :image_3 do |story|
        image_tag story.image_3 .thumb, width: "40"
      end
      row :caption_3
      row :image_4 do |story|
        image_tag story.image_4.thumb, width: "40"
      end
      row :caption_4
      row :image_5 do |story|
        image_tag story.image_5.thumb, width: "40"
      end
      row :caption_5
      row :quote
      row :is_featured
      row :categories do |category|
        category.categories.all.map do |t|
          t.title
        end
      end
    end
    active_admin_comments
  end

  index do
    selectable_column
    index_column
    column "Main image" do |story|
      image_tag story.image_1.thumb, width: "40"
    end

    column :title
    column :byline
    column :standfirst




    column :is_featured
    column :quote
    column :categories do |category|
      category.categories.all.map do |t|
        t.title
      end
    end


    actions
  end

  form do |f|
     f.inputs "Story" do
       f.input :title
       f.input :byline
       f.input :credit
       f.input :standfirst
       f.input :body
       f.input :quote
     end

     f.inputs "Filters" do
       f.input :is_featured, label: "Featured story?"
     end

     f.inputs "Images" do
       f.input :image_1, hint: image_tag(f.object.image_1.thumb)
       f.input :image_2, hint: image_tag(f.object.image_2.thumb)
       f.input :image_3, hint: image_tag(f.object.image_3.thumb)
       f.input :image_4, hint: image_tag(f.object.image_4.thumb)
       f.input :image_5, hint: image_tag(f.object.image_5.thumb)
     end

     f.inputs "Captions" do
        f.input :caption_1
        f.input :caption_2
        f.input :caption_3
        f.input :caption_4
        f.input :caption_5
     end

     f.inputs "Categories" do
        f.input :categories, as: :check_boxes, collection: Category.order("title asc")
     end

     f.actions

   end


    filter :title
    filter :byline
    filter :created_at
    filter :is_featured
    filter :categories
end
