require 'rails_helper'

RSpec.describe "memberinvites/show", type: :view do
  before(:each) do
    @memberinvite = assign(:memberinvite, Memberinvite.create!(
      :email => "Email",
      :account_id => 1,
      :sender_id => 2,
      :receiver_id => 3,
      :token => "Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Token/)
  end
end
