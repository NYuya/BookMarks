require 'rails_helper'

RSpec.describe "Customers::FolderBookmarks", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/customers/folder_bookmarks/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/customers/folder_bookmarks/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/customers/folder_bookmarks/update"
      expect(response).to have_http_status(:success)
    end
  end

end
