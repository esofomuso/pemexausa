require 'rails_helper'

RSpec.describe "admin/photos/index", type: :view do
  before(:each) do
    assign(:admin_photos, [
      Admin::Photo.create!(),
      Admin::Photo.create!()
    ])
  end

  it "renders a list of admin/photos" do
    render
  end
end
