require 'rails_helper'

RSpec.describe "Customers::Folders", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/customers/folders/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/customers/folders/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/customers/folders/update"
      expect(response).to have_http_status(:success)
    end
  end

end
