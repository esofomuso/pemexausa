require 'rails_helper'

RSpec.describe "admin/payments/edit", type: :view do
  before(:each) do
    @admin_payment = assign(:admin_payment, Admin::Payment.create!())
  end

  it "renders the edit admin_payment form" do
    render

    assert_select "form[action=?][method=?]", admin_payment_path(@admin_payment), "post" do
    end
  end
end
