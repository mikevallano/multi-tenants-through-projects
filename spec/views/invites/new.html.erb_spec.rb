require 'rails_helper'

RSpec.describe "invites/new", type: :view do
  before(:each) do
    assign(:invite, Invite.new(
      :email => "MyString",
      :account_id => 1,
      :project_ids => 1,
      :role_ids => 1,
      :sender_id => 1,
      :receiver_id => 1,
      :token => "MyString"
    ))
  end

  it "renders new invite form" do
    render

    assert_select "form[action=?][method=?]", invites_path, "post" do

      assert_select "input#invite_email[name=?]", "invite[email]"

      assert_select "input#invite_account_id[name=?]", "invite[account_id]"

      assert_select "input#invite_project_ids[name=?]", "invite[project_ids]"

      assert_select "input#invite_role_ids[name=?]", "invite[role_ids]"

      assert_select "input#invite_sender_id[name=?]", "invite[sender_id]"

      assert_select "input#invite_receiver_id[name=?]", "invite[receiver_id]"

      assert_select "input#invite_token[name=?]", "invite[token]"
    end
  end
end
