ActiveAdmin.register Image do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :image, :category_id

  index do
    column :id do |image|
      link_to "#{image.id}", admin_image_path(image)
    end
    column :category
    column :image do |image|
      image_tag image.image.url(:thumbnail)
    end
    column :created_at
    column :updated_at
  end

  show do
    attributes_table_for(resource) do
      row :image do |image|
        image_tag image.image.url
      end
    end
    active_admin_comments_for(resource)

  end

  #
  # or
  #
  # permit_params do
  #   permitted = [:image, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
