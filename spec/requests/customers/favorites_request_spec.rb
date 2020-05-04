require 'rails_helper'

RSpec.describe "Customers::Favorites", type: :request do

  describe "GET /destroy" do
    it "returns http success" do
      get "/customers/favorites/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/customers/favorites/create"
      expect(response).to have_http_status(:success)
    end
  end

end
