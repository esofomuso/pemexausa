require "rails_helper"

RSpec.describe Admin::CountriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/countries").to route_to("admin/countries#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/countries/new").to route_to("admin/countries#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/countries/1").to route_to("admin/countries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/countries/1/edit").to route_to("admin/countries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/countries").to route_to("admin/countries#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/countries/1").to route_to("admin/countries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/countries/1").to route_to("admin/countries#destroy", :id => "1")
    end

  end
end
