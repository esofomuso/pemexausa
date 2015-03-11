require 'rails_helper'

RSpec.describe "admin/payments/new", type: :view do
  before(:each) do
    assign(:admin_payment, Admin::Payment.new())
  end

  it "renders new admin_payment form" do
    render

    assert_select "form[action=?][method=?]", admin_payments_path, "post" do
    end
  end
end
