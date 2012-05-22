require "spec_helper"

describe SocketConnectorsController do
  describe "routing" do

    it "routes to #index" do
      get("/socket_connectors").should route_to("socket_connectors#index")
    end

    it "routes to #new" do
      get("/socket_connectors/new").should route_to("socket_connectors#new")
    end

    it "routes to #show" do
      get("/socket_connectors/1").should route_to("socket_connectors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/socket_connectors/1/edit").should route_to("socket_connectors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/socket_connectors").should route_to("socket_connectors#create")
    end

    it "routes to #update" do
      put("/socket_connectors/1").should route_to("socket_connectors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/socket_connectors/1").should route_to("socket_connectors#destroy", :id => "1")
    end

  end
end
