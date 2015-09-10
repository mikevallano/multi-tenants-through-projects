require 'rails_helper'

RSpec.describe "chats/show", type: :view do
  before(:each) do
    @chat = assign(:chat, Chat.create!(
      :name => "Name",
      :description => "Description",
      :slug => "Slug",
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(//)
  end
end
