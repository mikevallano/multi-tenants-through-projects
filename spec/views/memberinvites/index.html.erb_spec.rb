require 'rails_helper'

RSpec.describe "memberinvites/index", type: :view do
  before(:each) do
    assign(:memberinvites, [
      Memberinvite.create!(
        :email => "Email",
        :account_id => 1,
        :sender_id => 2,
        :receiver_id => 3,
        :token => "Token"
      ),
      Memberinvite.create!(
        :email => "Email",
        :account_id => 1,
        :sender_id => 2,
        :receiver_id => 3,
        :token => "Token"
      )
    ])
  end

  it "renders a list of memberinvites" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Token".to_s, :count => 2
  end
end
