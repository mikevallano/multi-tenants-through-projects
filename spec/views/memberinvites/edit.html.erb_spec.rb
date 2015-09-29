require 'rails_helper'

RSpec.describe "memberinvites/edit", type: :view do
  before(:each) do
    @memberinvite = assign(:memberinvite, Memberinvite.create!(
      :email => "MyString",
      :account_id => 1,
      :sender_id => 1,
      :receiver_id => 1,
      :token => "MyString"
    ))
  end

  it "renders the edit memberinvite form" do
    render

    assert_select "form[action=?][method=?]", memberinvite_path(@memberinvite), "post" do

      assert_select "input#memberinvite_email[name=?]", "memberinvite[email]"

      assert_select "input#memberinvite_account_id[name=?]", "memberinvite[account_id]"

      assert_select "input#memberinvite_sender_id[name=?]", "memberinvite[sender_id]"

      assert_select "input#memberinvite_receiver_id[name=?]", "memberinvite[receiver_id]"

      assert_select "input#memberinvite_token[name=?]", "memberinvite[token]"
    end
  end
end
