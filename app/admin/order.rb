ActiveAdmin.register Order do

  permit_params :first_name, :last_name, :email, :country, :address_1,
    :address_2, :city, :postal_code, :delivery_first_name, :delivery_last_name, :delivery_address_1,
    :delivery_address_2, :delivery_city, :delivery_postal_code, :delivery_country,
    order_items_attributes: [:id, :product_id, :quantity, :product_variant_id, :quantity, :_destroy]

    show do
      attributes_table do
       row :first_name
       row :last_name
       row :email
       row :address_1
       row :address_2
       row :city
       row :postal_code
       row :country

       row :delivery_first_name
       row :delivery_last_name
       row :delivery_address_1
       row :delivery_address_2
       row :delivery_city
       row :delivery_postal_code
       row :delivery_country

       row :order_items do |order|
         order.order_items.all.map do |item|
            "#{item.quantity} x #{item.product.try(:title)} - #{item.product_variant.try(:size)}"
         end
       end

      end
      active_admin_comments
  end

    index do
      selectable_column
      id_column
      column :name do |order|
        order.first_name + " " + order.last_name
      end
      column :email
      column :country

      actions
    end

    form do |f|
        f.inputs do
          f.input :first_name
          f.input :last_name
          f.input :email
      end

        f.inputs "Billing address" do
          f.input :address_1
          f.input :address_2
          f.input :city
          f.input :postal_code
          f.input :country
        end

        f.inputs "Delivery address" do
          f.input :delivery_address_1
          f.input :delivery_address_2
          f.input :delivery_city
          f.input :delivery_postal_code
          f.input :delivery_country
        end

        f.has_many :order_items, heading: "Products" do |productf|

          productf.input :product
          productf.input :quantity
          productf.input :product_variant, as: :select, collection: ProductVariant.all.map{ |v| ["#{v.product.try(:title)} - #{v.size}", v.id] }
        end

        f.actions
    end




end
