require 'rails_helper'

RSpec.describe "invites/index", type: :view do
  before(:each) do
    assign(:invites, [
      Invite.create!(
        :email => "Email",
        :account_id => 1,
        :project_ids => 2,
        :role_ids => 3,
        :sender_id => 4,
        :receiver_id => 5,
        :token => "Token"
      ),
      Invite.create!(
        :email => "Email",
        :account_id => 1,
        :project_ids => 2,
        :role_ids => 3,
        :sender_id => 4,
        :receiver_id => 5,
        :token => "Token"
      )
    ])
  end

  it "renders a list of invites" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Token".to_s, :count => 2
  end
end
