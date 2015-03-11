require 'rails_helper'

RSpec.describe "admin/payments/index", type: :view do
  before(:each) do
    assign(:admin_payments, [
      Admin::Payment.create!(),
      Admin::Payment.create!()
    ])
  end

  it "renders a list of admin/payments" do
    render
  end
end
