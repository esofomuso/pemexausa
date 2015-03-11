require 'rails_helper'

RSpec.describe "admin/countries/index", type: :view do
  before(:each) do
    assign(:admin_countries, [
      Admin::Country.create!(),
      Admin::Country.create!()
    ])
  end

  it "renders a list of admin/countries" do
    render
  end
end
