require 'rails_helper'

RSpec.describe "admin/chapters/show", type: :view do
  before(:each) do
    @admin_chapter = assign(:admin_chapter, Admin::Chapter.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
