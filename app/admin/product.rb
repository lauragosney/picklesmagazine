ActiveAdmin.register Product do

 permit_params :title, :image_1, :image_2, :image_3, :image_4, :image_5, :image_6, :allow_destroy
  :price_in_pounds, :collection_date, :description, :is_featured, :on_homepage, :on_homepage_slottwo, :is_sold_out, :quote, :quote_credit, product_variants_attributes: [:id, :size, :is_sold_out, :rank, :_destroy]

  show do
    attributes_table do
     row :title
     row :image_1 do |product|
       image_tag product.image_1.thumb, width: "40"
     end
     row :image_2 do |product|
       image_tag product.image_2.thumb, width: "40"
     end
     row :image_3 do |product|
       image_tag product.image_3 .thumb, width: "40"
     end
     row :image_4 do |product|
       image_tag product.image_4.thumb, width: "40"
     end
     row :image_5 do |product|
       image_tag product.image_5.thumb, width: "40"
     end
     row :image_6 do |product|
       image_tag product.image_6.thumb, width: "40"
     end
     row :sizes do |product|
       sizes = product.product_variants.map do |v|
         v.size
       end
       sizes.join(",")
     end
     row :is_sold_out do |product|
       is_sold_out = product.product_variants.map do |v|
         v.is_sold_out
        end
      end
      row :price_in_pounds, :sortable => :price_in_pounds do |cur|
            number_to_currency cur.price_in_pounds, unit: "£"
        end
      row :is_featured
      row :on_homepage
      row :on_homepage_slottwo
      row :is_sold_out
      row :quote
      row :quote_credit
     end
      active_admin_comments


end

 index do
   selectable_column
   index_column
   column "Main image" do |product|
     image_tag product.image_1.thumb, width: "40"
   end

   column :title
   column :sizes do |product|
     sizes = product.product_variants.map do |v|
       str = v.size
       if v.is_sold_out?
         str = v.size + " " +  "(sold out)"
       end
       str
     end
     sizes.to_sentence
   end

   column :price_in_pounds, :sortable => :price_in_pounds do |cur|
         number_to_currency cur.price_in_pounds, unit: "£"
     end
   column :on_homepage
   column :on_homepage_slottwo
   column :is_featured
   column :is_sold_out
   column :quote
   column :quote_credit

   actions
 end

 form do |f|
    f.inputs "Product info" do
      f.input :title
      f.input :price_in_pounds, :sortable => :price_in_pounds do |cur|
            number_to_currency cur.price_in_pounds, unit: "£"
        end
      f.input :description
      f.input :quote
      f.input :quote_credit
      f.input :collection_date
    end

    f.inputs "Filters" do
      f.input :is_featured, label: "Featured product?"
      f.input :on_homepage, label: "On homepage slot 1?"
      f.input :on_homepage_slottwo, label: "On homepage slot 2?"
      f.input :is_sold_out, label: "Sold out?"
    end

    f.inputs "Images" do
      f.input :image_1, hint: image_tag(f.object.image_1.thumb)
      f.input :image_2, hint: image_tag(f.object.image_2.thumb)
      f.input :image_3, hint: image_tag(f.object.image_3.thumb)
      f.input :image_4, hint: image_tag(f.object.image_4.thumb)
      f.input :image_5, hint: image_tag(f.object.image_5.thumb)
      f.input :image_6, hint: image_tag(f.object.image_6.thumb)
    end

    f.inputs "Sizes" do
      f.has_many :product_variants, allow_destroy: true, new_record: true, sortable: :rank, sortable_start: 1 do |t|
        t.input :size, as: :select, collection: ["S", "M", "L", "XL", "XXL"]
        t.input :is_sold_out, label: "Sold out?"
      end
    end

    f.actions

  end


  filter :title
  filter :price_in_pounds
  filter :created_at
  filter :collection_date
  filter :is_featured
  filter :is_sold_out

end
