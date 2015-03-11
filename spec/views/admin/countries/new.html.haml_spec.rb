require 'rails_helper'

RSpec.describe "admin/countries/new", type: :view do
  before(:each) do
    assign(:admin_country, Admin::Country.new())
  end

  it "renders new admin_country form" do
    render

    assert_select "form[action=?][method=?]", admin_countries_path, "post" do
    end
  end
end
