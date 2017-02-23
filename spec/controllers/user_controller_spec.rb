require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "GET #song" do
    it "returns http success" do
      get :song
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #list" do
    it "returns http success" do
      get :list
      expect(response).to have_http_status(:success)
    end
  end

end
