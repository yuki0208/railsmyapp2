require 'rails_helper'
describe UsersController do


  before do
    @user = FactoryGirl.create(:user)
    allow(controller)
      .to receive(:current_user)
      .and_return(@user)
  end
  
  describe "GET #index" do
    let!(:user) { FactoryGirl.create(:user, :activated) }
    it "@usersにユーザがすべて入っていること" do      
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET #show" do
    let!(:user) { FactoryGirl.create(:user) }
    it "idで指定したユーザが@userに入っていること" do    
      get :show, params: { id: user.to_param }
      expect(assigns(:user)).to eq(user)
    end
  end
end