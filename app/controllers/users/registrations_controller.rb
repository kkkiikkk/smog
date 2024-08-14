# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]
    before_action :set_request_url, only: %i[create update destroy]
    after_action  :new_action, only: %i[create update destroy]

    def create
      super do
        @action_description = 'new user sign up'
      end
    end

    def update
      super do
        @action_description = 'edit user'
      end
    end

    def destroy
      super do
        @action_description = 'delete user'
      end
    end

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end

    private

    def set_request_url
      @request_url = request.url
    end

    def new_action
      return if @action_description.nil?

      action_creator = ActionCreator.new(@action_description, @request_url, current_user.email)
      action_creator.create
      @action_description = nil
    end
  end
end
