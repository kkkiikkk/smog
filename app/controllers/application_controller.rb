class ApplicationController < ActionController::Base
  def index
    @images = Image.take(5)
  end
end
