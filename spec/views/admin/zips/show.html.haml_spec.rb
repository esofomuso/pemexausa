require 'rails_helper'

RSpec.describe "admin/zips/show", type: :view do
  before(:each) do
    @admin_zip = assign(:admin_zip, Admin::Zip.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
