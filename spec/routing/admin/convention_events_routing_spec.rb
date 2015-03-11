require "rails_helper"

RSpec.describe Admin::ConventionEventsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/convention_events").to route_to("admin/convention_events#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/convention_events/new").to route_to("admin/convention_events#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/convention_events/1").to route_to("admin/convention_events#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/convention_events/1/edit").to route_to("admin/convention_events#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/convention_events").to route_to("admin/convention_events#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/convention_events/1").to route_to("admin/convention_events#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/convention_events/1").to route_to("admin/convention_events#destroy", :id => "1")
    end

  end
end
