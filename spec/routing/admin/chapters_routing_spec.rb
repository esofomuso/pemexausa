require "rails_helper"

RSpec.describe Admin::ChaptersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/chapters").to route_to("admin/chapters#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/chapters/new").to route_to("admin/chapters#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/chapters/1").to route_to("admin/chapters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/chapters/1/edit").to route_to("admin/chapters#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/chapters").to route_to("admin/chapters#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/chapters/1").to route_to("admin/chapters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/chapters/1").to route_to("admin/chapters#destroy", :id => "1")
    end

  end
end
