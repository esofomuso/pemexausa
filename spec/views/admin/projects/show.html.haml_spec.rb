require 'rails_helper'

RSpec.describe "admin/projects/show", type: :view do
  before(:each) do
    @admin_project = assign(:admin_project, Admin::Project.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
