require "spec_helper"

describe UdpSocketsController do
  describe "routing" do

    it "routes to #index" do
      get("/udp_sockets").should route_to("udp_sockets#index")
    end

    it "routes to #new" do
      get("/udp_sockets/new").should route_to("udp_sockets#new")
    end

    it "routes to #show" do
      get("/udp_sockets/1").should route_to("udp_sockets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/udp_sockets/1/edit").should route_to("udp_sockets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/udp_sockets").should route_to("udp_sockets#create")
    end

    it "routes to #update" do
      put("/udp_sockets/1").should route_to("udp_sockets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/udp_sockets/1").should route_to("udp_sockets#destroy", :id => "1")
    end

  end
end
