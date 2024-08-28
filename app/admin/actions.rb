# frozen_string_literal: true

ActiveAdmin.register Action do
  permit_params :action_type, :email, :url, :timestamp
end
