require "rails_helper"

RSpec.describe MemberinvitesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/memberinvites").to route_to("memberinvites#index")
    end

    it "routes to #new" do
      expect(:get => "/memberinvites/new").to route_to("memberinvites#new")
    end

    it "routes to #show" do
      expect(:get => "/memberinvites/1").to route_to("memberinvites#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/memberinvites/1/edit").to route_to("memberinvites#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/memberinvites").to route_to("memberinvites#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/memberinvites/1").to route_to("memberinvites#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/memberinvites/1").to route_to("memberinvites#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/memberinvites/1").to route_to("memberinvites#destroy", :id => "1")
    end

  end
end
