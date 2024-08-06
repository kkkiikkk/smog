class ApplicationController < ActionController::Base

  def index
    @images = Image.all
  end
end
