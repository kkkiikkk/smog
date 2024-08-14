# frozen_string_literal: true

module Users
  class OmniauthController < Devise::OmniauthCallbacksController
    before_action :set_request_url, only: %i[google_oauth2]
    after_action  :new_action, only: %i[google_oauth2]

    def google_oauth2
      @user = User.create_from_provider_data(request.env['omniauth.auth'])
      if @user.persisted?
        @action_description = 'signing via google'
        sign_in_and_redirect @user
        set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
      else
        flash[:error] =
          'There was a problem signing you in through Google. Please register or try signing in later.'
        redirect_to root_path
      end
    end

    def failure
      flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
      redirect_to root_path
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
