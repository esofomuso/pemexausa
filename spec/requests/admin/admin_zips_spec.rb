require 'rails_helper'

RSpec.describe "Admin::Zips", type: :request do
  describe "GET /admin_zips" do
    it "works! (now write some real specs)" do
      get admin_zips_path
      expect(response).to have_http_status(200)
    end
  end
end
