require 'rails_helper'

RSpec.describe "admin/projects/edit", type: :view do
  before(:each) do
    @admin_project = assign(:admin_project, Admin::Project.create!())
  end

  it "renders the edit admin_project form" do
    render

    assert_select "form[action=?][method=?]", admin_project_path(@admin_project), "post" do
    end
  end
end
