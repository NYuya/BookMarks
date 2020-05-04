require 'rails_helper'

RSpec.describe "Customers::Genres", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/customers/genres/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/customers/genres/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/customers/genres/update"
      expect(response).to have_http_status(:success)
    end
  end

end
