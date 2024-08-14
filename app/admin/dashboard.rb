# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
        span I18n.t('active_admin.dashboard_welcome.welcome')
        small I18n.t('active_admin.dashboard_welcome.call_to_action')
      end
    end

    columns do
      column do
        panel 'Recent Created Comments' do
          ul do
            Comment.order(created_at: :desc, id: :desc).take(5).map do |comment|
              li link_to(comment.caption, admin_comment_path(comment))
            end
          end
        end
      end
    end

    columns do
      column do
        panel 'Recent Created Categories' do
          ul do
            Category.order(created_at: :desc, id: :desc).take(5).map do |category|
              li link_to(category.name, admin_category_path(category))
            end
          end
        end
      end
    end

    columns do
      column do
        panel 'Recent Created Images' do
          ul do
            Image.order(created_at: :desc, id: :desc).take(5).map do |image|
              li link_to(image.id, admin_image_path(image))
            end
          end
        end
      end
    end
  end
end
