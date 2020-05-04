require 'rails_helper'

RSpec.describe "Customers::Bookmarks", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/customers/bookmarks/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/customers/bookmarks/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /top" do
    it "returns http success" do
      get "/customers/bookmarks/top"
      expect(response).to have_http_status(:success)
    end
  end

end
