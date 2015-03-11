require "rails_helper"

RSpec.describe Admin::PaymentPurposesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/payment_purposes").to route_to("admin/payment_purposes#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/payment_purposes/new").to route_to("admin/payment_purposes#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/payment_purposes/1").to route_to("admin/payment_purposes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/payment_purposes/1/edit").to route_to("admin/payment_purposes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/payment_purposes").to route_to("admin/payment_purposes#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/payment_purposes/1").to route_to("admin/payment_purposes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/payment_purposes/1").to route_to("admin/payment_purposes#destroy", :id => "1")
    end

  end
end
