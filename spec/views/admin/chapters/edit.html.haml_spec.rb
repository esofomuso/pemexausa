require 'rails_helper'

RSpec.describe "admin/chapters/edit", type: :view do
  before(:each) do
    @admin_chapter = assign(:admin_chapter, Admin::Chapter.create!())
  end

  it "renders the edit admin_chapter form" do
    render

    assert_select "form[action=?][method=?]", admin_chapter_path(@admin_chapter), "post" do
    end
  end
end
