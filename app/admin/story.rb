ActiveAdmin.register Story do

  permit_params :title, :byline, :standfirst, :body, :image_1, :image_2, :image_3, :image_4, :image_5, :quote,
  :caption_1, :caption_2, :caption_3, :caption_4, :caption_5, :credit, :is_featured, :on_homepage, category_ids:[]

   show do
     attributes_table do
      row :title do |editor|
        editor.title.html_safe
      end
      row :byline do |editor|
        editor.byline.html_safe
      end
      row :standfirst do |editor|
        editor.standfirst.html_safe
      end
      row :credit do |editor|
        editor.credit.html_safe
      end
      row :image_1 do |story|
        image_tag story.image_1.thumb, width: "40"
      end
      row :caption_1 do |editor|
        editor.caption_1.html_safe
      end
      row :body do |editor|
        editor.body.html_safe
      end
      row :image_2 do |story|
        image_tag story.image_2.thumb, width: "40"
      end
      row :caption_2 do |editor|
        editor.caption_2.html_safe
      end
      row :image_3 do |story|
        image_tag story.image_3 .thumb, width: "40"
      end
      row :caption_3 do |editor|
        editor.caption_3.html_safe
      end
      row :image_4 do |story|
        image_tag story.image_4.thumb, width: "40"
      end
      row :caption_4 do |editor|
        editor.caption_4.html_safe
      end
      row :image_5 do |story|
        image_tag story.image_5.thumb, width: "40"
      end
      row :caption_5 do |editor|
        editor.caption_5.html_safe
      end
      row :quote do |editor|
        editor.quote.html_safe
      end
      row :is_featured
      row :on_homepage
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

    column :title do |editor|
      editor.title.html_safe
    end
    column :byline do |editor|
      editor.byline.html_safe
    end
    column :standfirst do |editor|
      editor.standfirst.html_safe
    end



    column :is_featured
    column :on_homepage
    column :quote do |editor|
      editor.quote.html_safe
    end
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
       f.input :standfirst, as: :trumbowyg
       f.input :body, as: :trumbowyg
       f.input :quote
     end

     f.inputs "Filters" do
       f.input :is_featured, label: "Featured story?"
       f.input :on_homepage, label: "On homepage?"
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
