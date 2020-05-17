require 'rails_helper'

RSpec.describe "Chats", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/chats/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/chats/create"
      expect(response).to have_http_status(:success)
    end
  end

end
