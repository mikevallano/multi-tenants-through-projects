require "rails_helper"

RSpec.describe ApplicationController, :type => :controller do
  controller do
    def index
      render :nothing => true
    end
  end

  describe "GET #index" do

    account_name = "atestaccount"

    before(:each) do
      @account = FactoryGirl.create(:account, subdomain: account_name)
      @request.host = "#{account_name}.example.com"
    end

    it "always sets the current account based on subdomain" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
      binding.pry
      expect(assigns(:account).subdomain).to eq(account_name)
    end

  end
end