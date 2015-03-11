require 'rails_helper'

RSpec.describe "Admin::Chapters", type: :request do
  describe "GET /admin_chapters" do
    it "works! (now write some real specs)" do
      get admin_chapters_path
      expect(response).to have_http_status(200)
    end
  end
end
