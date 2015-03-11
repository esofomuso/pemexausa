require 'rails_helper'

RSpec.describe "admin/chapters/new", type: :view do
  before(:each) do
    assign(:admin_chapter, Admin::Chapter.new())
  end

  it "renders new admin_chapter form" do
    render

    assert_select "form[action=?][method=?]", admin_chapters_path, "post" do
    end
  end
end
