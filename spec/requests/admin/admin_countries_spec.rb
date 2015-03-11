require 'rails_helper'

RSpec.describe "Admin::Countries", type: :request do
  describe "GET /admin_countries" do
    it "works! (now write some real specs)" do
      get admin_countries_path
      expect(response).to have_http_status(200)
    end
  end
end
