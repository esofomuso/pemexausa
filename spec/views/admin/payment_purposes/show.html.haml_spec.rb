require 'rails_helper'

RSpec.describe "admin/payment_purposes/show", type: :view do
  before(:each) do
    @admin_payment_purpose = assign(:admin_payment_purpose, Admin::PaymentPurpose.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
