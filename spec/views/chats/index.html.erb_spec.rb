require 'rails_helper'

RSpec.describe "chats/index", type: :view do
  before(:each) do
    assign(:chats, [
      Chat.create!(
        :name => "Name",
        :description => "Description",
        :slug => "Slug",
        :project => nil
      ),
      Chat.create!(
        :name => "Name",
        :description => "Description",
        :slug => "Slug",
        :project => nil
      )
    ])
  end

  it "renders a list of chats" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
