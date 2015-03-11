require 'rails_helper'

RSpec.describe "admin/projects/index", type: :view do
  before(:each) do
    assign(:admin_projects, [
      Admin::Project.create!(),
      Admin::Project.create!()
    ])
  end

  it "renders a list of admin/projects" do
    render
  end
end
