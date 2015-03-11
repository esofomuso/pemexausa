require 'rails_helper'

RSpec.describe "admin/photos/edit", type: :view do
  before(:each) do
    @admin_photo = assign(:admin_photo, Admin::Photo.create!())
  end

  it "renders the edit admin_photo form" do
    render

    assert_select "form[action=?][method=?]", admin_photo_path(@admin_photo), "post" do
    end
  end
end
