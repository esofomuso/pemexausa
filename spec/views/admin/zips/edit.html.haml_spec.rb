require 'rails_helper'

RSpec.describe "admin/zips/edit", type: :view do
  before(:each) do
    @admin_zip = assign(:admin_zip, Admin::Zip.create!())
  end

  it "renders the edit admin_zip form" do
    render

    assert_select "form[action=?][method=?]", admin_zip_path(@admin_zip), "post" do
    end
  end
end
