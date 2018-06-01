ActiveAdmin.register Event do
  permit_params :date, :title, :image, :description, :price, :time, :venue, :more_information

   show do
     attributes_table do
      row :date
      row :title
      row :image do |event|
        image_tag event.image.thumb, width: "40"
      end
      row :description
      row :price
      row :time
      row :venue
      row :more_information do |editor|
        editor.more_information.html_safe
      end
    end
    active_admin_comments
  end

  index do
    selectable_column
    index_column

    column :date
    column :title
    column "Main image" do |event|
      image_tag event.image.thumb, width: "40"
      end
    column :description
    column :price
    column :time
    column :venue
    column :more_information do |editor|
      editor.more_information.html_safe
    end
    actions
  end

  form do |f|
     f.inputs "Event" do
       f.input :date
       f.input :title
       f.input :description
       f.input :price
       f.input :time
       f.input :venue
       f.input :more_information, as: :trumbowyg
     end

     f.inputs "Images" do
       f.input :image
     end

     f.actions

   end


    filter :title
    filter :date
    filter :created_at
    filter :price
    filter :time
    filter :venue

end
