require 'rails_helper'

RSpec.describe "admin/convention_events/index", type: :view do
  before(:each) do
    assign(:admin_convention_events, [
      Admin::ConventionEvent.create!(),
      Admin::ConventionEvent.create!()
    ])
  end

  it "renders a list of admin/convention_events" do
    render
  end
end
