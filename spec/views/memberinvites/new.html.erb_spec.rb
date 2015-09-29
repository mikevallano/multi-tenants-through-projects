require 'rails_helper'

RSpec.describe "memberinvites/new", type: :view do
  before(:each) do
    assign(:memberinvite, Memberinvite.new(
      :email => "MyString",
      :account_id => 1,
      :sender_id => 1,
      :receiver_id => 1,
      :token => "MyString"
    ))
  end

  it "renders new memberinvite form" do
    render

    assert_select "form[action=?][method=?]", memberinvites_path, "post" do

      assert_select "input#memberinvite_email[name=?]", "memberinvite[email]"

      assert_select "input#memberinvite_account_id[name=?]", "memberinvite[account_id]"

      assert_select "input#memberinvite_sender_id[name=?]", "memberinvite[sender_id]"

      assert_select "input#memberinvite_receiver_id[name=?]", "memberinvite[receiver_id]"

      assert_select "input#memberinvite_token[name=?]", "memberinvite[token]"
    end
  end
end
