require 'spec_helper'
describe SessionsController do
  before do
    User.create(email: 'guille@gmail.com', password: '123456')
  end

  def valid_attributes
    { email: 'guille@gmail.com', password: '123456' }
  end

  describe "GET new" do
    it "render new session template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new a session" do
        post :create, valid_attributes
        session[:user_id].should_not be_nil
      end

      it "redirects to the root path" do
        post :create, valid_attributes
        response.should redirect_to(root_path)
      end
    end

    describe "with invalid params" do
      it "not assign session" do
        User.any_instance.stub(:authenticate).and_return(false)
        post :create, { email: "guilleiguaran@gmail.com", password: "" }
        flash[:session].should be_nil
      end

      it "re-renders the 'new' template" do
        User.any_instance.stub(:authenticate).and_return(false)
        post :create, { email: "guilleiguaran@gmail.com", password: "" }
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the actual session" do
      delete :destroy, {}, { user_id: User.first.id }
      session[:user_id].should be_nil
    end

    it "redirects to the root url" do
      delete :destroy, {}, { user_id: User.first.id }
      response.should redirect_to(root_url)
    end
  end

end
