require 'rails_helper'

RSpec.describe "Admins::Bookmarks", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admins/bookmarks/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admins/bookmarks/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admins/bookmarks/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/admins/bookmarks/update"
      expect(response).to have_http_status(:success)
    end
  end

end
