require 'rails_helper'

RSpec.describe "admin/chapters/index", type: :view do
  before(:each) do
    assign(:admin_chapters, [
      Admin::Chapter.create!(),
      Admin::Chapter.create!()
    ])
  end

  it "renders a list of admin/chapters" do
    render
  end
end
