require 'rails_helper'

RSpec.describe AuthenticateController, type: :controller do

  describe "GET #authenticate_admin" do
    it "returns http success" do
      get :authenticate_admin
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #auth_params" do
    it "returns http success" do
      get :auth_params
      expect(response).to have_http_status(:success)
    end
  end

end
