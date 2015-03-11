require 'rails_helper'

RSpec.describe "Admin::PaymentPurposes", type: :request do
  describe "GET /admin_payment_purposes" do
    it "works! (now write some real specs)" do
      get admin_payment_purposes_path
      expect(response).to have_http_status(200)
    end
  end
end
