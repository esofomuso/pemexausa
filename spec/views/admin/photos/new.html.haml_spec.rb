require 'rails_helper'

RSpec.describe "admin/photos/new", type: :view do
  before(:each) do
    assign(:admin_photo, Admin::Photo.new())
  end

  it "renders new admin_photo form" do
    render

    assert_select "form[action=?][method=?]", admin_photos_path, "post" do
    end
  end
end
