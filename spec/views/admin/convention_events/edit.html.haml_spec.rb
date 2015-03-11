require 'rails_helper'

RSpec.describe "admin/convention_events/edit", type: :view do
  before(:each) do
    @admin_convention_event = assign(:admin_convention_event, Admin::ConventionEvent.create!())
  end

  it "renders the edit admin_convention_event form" do
    render

    assert_select "form[action=?][method=?]", admin_convention_event_path(@admin_convention_event), "post" do
    end
  end
end
