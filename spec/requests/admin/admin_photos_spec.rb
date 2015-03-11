require 'rails_helper'

RSpec.describe "Admin::Photos", type: :request do
  describe "GET /admin_photos" do
    it "works! (now write some real specs)" do
      get admin_photos_path
      expect(response).to have_http_status(200)
    end
  end
end
