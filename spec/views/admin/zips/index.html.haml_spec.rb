require 'rails_helper'

RSpec.describe "admin/zips/index", type: :view do
  before(:each) do
    assign(:admin_zips, [
      Admin::Zip.create!(),
      Admin::Zip.create!()
    ])
  end

  it "renders a list of admin/zips" do
    render
  end
end
