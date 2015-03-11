require 'rails_helper'

RSpec.describe "admin/countries/edit", type: :view do
  before(:each) do
    @admin_country = assign(:admin_country, Admin::Country.create!())
  end

  it "renders the edit admin_country form" do
    render

    assert_select "form[action=?][method=?]", admin_country_path(@admin_country), "post" do
    end
  end
end
