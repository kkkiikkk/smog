require 'rails_helper'

RSpec.describe ImagesController, type: :controller do 
  describe 'GET #index' do 
    context 'succesfull response' do 
      # login_user
      it 'returns all images when' do
        get :index
        expect(response.status).to eq(200)
        
      end
    end
  end
end