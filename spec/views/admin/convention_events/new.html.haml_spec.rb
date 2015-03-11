require 'rails_helper'

RSpec.describe "admin/convention_events/new", type: :view do
  before(:each) do
    assign(:admin_convention_event, Admin::ConventionEvent.new())
  end

  it "renders new admin_convention_event form" do
    render

    assert_select "form[action=?][method=?]", admin_convention_events_path, "post" do
    end
  end
end
