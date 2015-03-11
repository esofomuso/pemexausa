require 'rails_helper'

RSpec.describe "admin/photos/show", type: :view do
  before(:each) do
    @admin_photo = assign(:admin_photo, Admin::Photo.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
