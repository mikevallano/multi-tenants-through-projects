require 'rails_helper'

RSpec.describe "chats/edit", type: :view do
  before(:each) do
    @chat = assign(:chat, Chat.create!(
      :name => "MyString",
      :description => "MyString",
      :slug => "MyString",
      :project => nil
    ))
  end

  it "renders the edit chat form" do
    render

    assert_select "form[action=?][method=?]", chat_path(@chat), "post" do

      assert_select "input#chat_name[name=?]", "chat[name]"

      assert_select "input#chat_description[name=?]", "chat[description]"

      assert_select "input#chat_slug[name=?]", "chat[slug]"

      assert_select "input#chat_project_id[name=?]", "chat[project_id]"
    end
  end
end
