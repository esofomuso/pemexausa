require 'rails_helper'

RSpec.describe "admin/countries/show", type: :view do
  before(:each) do
    @admin_country = assign(:admin_country, Admin::Country.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
