# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    prepend_before_action :check_captcha, only: [:create]
    before_action :set_request_url, only: %i[create destroy]
    before_action :set_current_user, only: %i[destroy]
    after_action  :new_action_signin, only: %i[create]
    after_action  :new_action_signout, only: %i[destroy]

    def create
      super do
      end
    end

    def destroy
      super do
      end
    end

    private

    def check_captcha
      puts sign_in_params
      return if verify_recaptcha

      self.resource = resource_class.new sign_in_params

      respond_with_navigational(resource) do
        flash.discard(:recaptcha_error)
        redirect_to new_user_session_path
      end
    end

    def set_request_url
      @request_url = request.url
    end

    def set_current_user
      @signout_user = current_user
    end

    def new_action_signin
      action_creator = ActionCreator.new('user signin', @request_url, current_user.email)
      action_creator.create
    end

    def new_action_signout
      action_creator = ActionCreator.new('user signout', @request_url, @signout_user.email)
      action_creator.create
    end
  end
end
