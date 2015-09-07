require "rails_helper"

RSpec.describe PostsController, :type => :controller do
  describe "GET #index" do

    account_name = "atestaccount"

    before(:each) do
      @account = FactoryGirl.create(:account, subdomain: account_name)
      @request.host = "#{account_name}.example.com"
    end

    it "only returns posts for a specific account and project" do
      # project1 = FactoryGirl.create(:project, account: @account)
      # project2 = FactoryGirl.create(:project)

      # post1 = FactoryGirl.create(:post, project: project1)
      # post2 = FactoryGirl.create(:post, project: project2)

      # # get account.domain.com/projects/1/posts should only return project 1
      # get :index, project_id: project1.id

      # expect(response).to be_success
      # expect(response).to have_http_status(200)
      # binding.pry
      # expect(assigns(:posts).to_a).to eq([project1])
    end

  end
end