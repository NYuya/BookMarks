require 'rails_helper'

RSpec.describe "Customers::Relationships", type: :request do

  describe "GET /followed" do
    it "returns http success" do
      get "/customers/relationships/followed"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /follower" do
    it "returns http success" do
      get "/customers/relationships/follower"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/customers/relationships/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/customers/relationships/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
