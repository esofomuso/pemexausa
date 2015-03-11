require 'rails_helper'

RSpec.describe "admin/convention_events/show", type: :view do
  before(:each) do
    @admin_convention_event = assign(:admin_convention_event, Admin::ConventionEvent.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
