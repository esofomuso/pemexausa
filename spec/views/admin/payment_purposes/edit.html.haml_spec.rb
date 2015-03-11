require 'rails_helper'

RSpec.describe "admin/payment_purposes/edit", type: :view do
  before(:each) do
    @admin_payment_purpose = assign(:admin_payment_purpose, Admin::PaymentPurpose.create!())
  end

  it "renders the edit admin_payment_purpose form" do
    render

    assert_select "form[action=?][method=?]", admin_payment_purpose_path(@admin_payment_purpose), "post" do
    end
  end
end
