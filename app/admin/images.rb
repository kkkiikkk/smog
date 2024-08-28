# frozen_string_literal: true

ActiveAdmin.register Image do
  permit_params :image, :category_id

  index do
    column :id do |image|
      link_to image.id.to_s, admin_image_path(image)
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
end
