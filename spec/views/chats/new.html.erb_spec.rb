require 'rails_helper'

RSpec.describe "chats/new", type: :view do
  before(:each) do
    assign(:chat, Chat.new(
      :name => "MyString",
      :description => "MyString",
      :slug => "MyString",
      :project => nil
    ))
  end

  it "renders new chat form" do
    render

    assert_select "form[action=?][method=?]", chats_path, "post" do

      assert_select "input#chat_name[name=?]", "chat[name]"

      assert_select "input#chat_description[name=?]", "chat[description]"

      assert_select "input#chat_slug[name=?]", "chat[slug]"

      assert_select "input#chat_project_id[name=?]", "chat[project_id]"
    end
  end
end
