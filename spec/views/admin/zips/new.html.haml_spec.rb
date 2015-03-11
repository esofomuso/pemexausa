require 'rails_helper'

RSpec.describe "admin/zips/new", type: :view do
  before(:each) do
    assign(:admin_zip, Admin::Zip.new())
  end

  it "renders new admin_zip form" do
    render

    assert_select "form[action=?][method=?]", admin_zips_path, "post" do
    end
  end
end
