require 'rails_helper'

RSpec.describe "admin/payment_purposes/index", type: :view do
  before(:each) do
    assign(:admin_payment_purposes, [
      Admin::PaymentPurpose.create!(),
      Admin::PaymentPurpose.create!()
    ])
  end

  it "renders a list of admin/payment_purposes" do
    render
  end
end
