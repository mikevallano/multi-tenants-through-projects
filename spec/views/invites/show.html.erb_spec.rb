require 'rails_helper'

RSpec.describe "invites/show", type: :view do
  before(:each) do
    @invite = assign(:invite, Invite.create!(
      :email => "Email",
      :account_id => 1,
      :project_ids => 2,
      :role_ids => 3,
      :sender_id => 4,
      :receiver_id => 5,
      :token => "Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Token/)
  end
end
