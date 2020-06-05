require "rails_helper"

RSpec.describe OgPreviewersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/og_previewers").to route_to("og_previewers#index")
    end

    it "routes to #new" do
      expect(get: "/og_previewers/new").to route_to("og_previewers#new")
    end

    it "routes to #show" do
      expect(get: "/og_previewers/1").to route_to("og_previewers#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/og_previewers").to route_to("og_previewers#create")
    end

    it "routes to #destroy" do
      expect(delete: "/og_previewers/1").to route_to("og_previewers#destroy", id: "1")
    end
  end
end
