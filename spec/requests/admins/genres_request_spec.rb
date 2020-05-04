require 'rails_helper'

RSpec.describe "Admins::Genres", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admins/genres/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/admins/genres/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admins/genres/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/admins/genres/update"
      expect(response).to have_http_status(:success)
    end
  end

end
