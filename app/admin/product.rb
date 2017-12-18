ActiveAdmin.register Product do

 permit_params :title, :image_1, :image_2, :image_3, :image_4, :image_5,
  :price, :collection_date, :description, :is_featured, :is_sold_out, :quote


 index do
   selectable_column
   index_column
   column "Main image" do |product|
     image_tag product.image_1.thumb, width: "40"
   end

   column :title
   column :price
   column :is_featured
   column :is_sold_out
   column :is_sold_out
   actions
 end

 form do |f|
    f.inputs "Product info" do
      f.input :title
      f.input :price
      f.input :description
      f.input :quote
      f.input :collection_date
    end

    f.inputs "Filters" do
      f.input :is_featured, label: "Featured product?"
      f.input :is_sold_out, label: "Sold out?"
    end

    f.inputs "Images" do
      f.input :image_1
      f.input :image_2
      f.input :image_3
      f.input :image_4
      f.input :image_5
      f.input :image_6
    end

    f.actions

  end
end
