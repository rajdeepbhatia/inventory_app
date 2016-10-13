require 'rails_helper'
RSpec.describe ItemsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user, scope: :user
  end

  describe 'GET #new' do
    it 'creates an object of Item model and assigns to instance variable' do
      get :new
      expect(assigns(:item)).to be_a_new(Item)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(assigns(:items)).to eq Item.load_table_data
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end
end
