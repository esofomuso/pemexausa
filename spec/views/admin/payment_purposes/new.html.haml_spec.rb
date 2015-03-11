require 'rails_helper'

RSpec.describe "admin/payment_purposes/new", type: :view do
  before(:each) do
    assign(:admin_payment_purpose, Admin::PaymentPurpose.new())
  end

  it "renders new admin_payment_purpose form" do
    render

    assert_select "form[action=?][method=?]", admin_payment_purposes_path, "post" do
    end
  end
end
