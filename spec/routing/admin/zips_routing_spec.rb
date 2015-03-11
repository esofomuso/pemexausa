require "rails_helper"

RSpec.describe Admin::ZipsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/zips").to route_to("admin/zips#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/zips/new").to route_to("admin/zips#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/zips/1").to route_to("admin/zips#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/zips/1/edit").to route_to("admin/zips#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/zips").to route_to("admin/zips#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/zips/1").to route_to("admin/zips#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/zips/1").to route_to("admin/zips#destroy", :id => "1")
    end

  end
end
