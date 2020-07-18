require "rails_helper"
require "spec_helper"

describe LinksController, type: :controller do
  context "GET new" do
    it "should get new" do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  context "GET show" do
    before(:all) do
      @link = Link.new(original_link: "https://www.google.com", link_identifier: "df34BD")
      @link.save
    end

    it "should redirect to correct url" do
      get :show, params: { link_identifier: @link.link_identifier }
      expect(response).to redirect_to("https://www.google.com")
    end
  end

  context "create" do
    it "should save valid link and show flash message" do
      expect do
        post :create, params: { link: { original_link: "https:://www.google.com" } }
      end.to change{ Link.count }.by(1)
      expect(flash[:success]). to eq "Short link generated"
    end

    it "should not save invalid link and show flash message" do
      expect do
        post :create, params: { link: { original_link: "www.google.com" } }
      end.to change{ Link.count }.by(0)
      expect(flash[:danger]). to eq "This is not a valid url"
    end

    it "should redirect to root path" do
      post :create, params: { link: { original_link: "www.google.com" } }
      expect(response).to redirect_to(root_url)
    end
  end

  context "destroy" do
    before(:all) do
      @link = Link.new(original_link: "https://www.google.com", link_identifier: "df34BD")
      @link.save
    end

    it "should delete link" do
      expect do
        delete :destroy, params: { id: @link.id }
      end.to change{ Link.count }.by(-1)
    end
  end
end
