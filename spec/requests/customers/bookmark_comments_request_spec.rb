require 'rails_helper'

RSpec.describe "Customers::BookmarkComments", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/customers/bookmark_comments/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/customers/bookmark_comments/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/customers/bookmark_comments/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/customers/bookmark_comments/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/customers/bookmark_comments/create"
      expect(response).to have_http_status(:success)
    end
  end

end
