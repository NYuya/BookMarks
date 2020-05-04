require 'rails_helper'

RSpec.describe "Admins::BookmarkComments", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admins/bookmark_comments/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admins/bookmark_comments/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/admins/bookmark_comments/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/admins/bookmark_comments/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
