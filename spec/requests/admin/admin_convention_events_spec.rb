require 'rails_helper'

RSpec.describe "Admin::ConventionEvents", type: :request do
  describe "GET /admin_convention_events" do
    it "works! (now write some real specs)" do
      get admin_convention_events_path
      expect(response).to have_http_status(200)
    end
  end
end
