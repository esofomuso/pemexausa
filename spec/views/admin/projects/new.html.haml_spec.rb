require 'rails_helper'

RSpec.describe "admin/projects/new", type: :view do
  before(:each) do
    assign(:admin_project, Admin::Project.new())
  end

  it "renders new admin_project form" do
    render

    assert_select "form[action=?][method=?]", admin_projects_path, "post" do
    end
  end
end
