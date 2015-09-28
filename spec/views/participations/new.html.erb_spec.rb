require 'rails_helper'

RSpec.describe "participations/new", type: :view do
  before(:each) do
    assign(:participation, Participation.new(
      :role => nil,
      :user => nil,
      :project => nil
    ))
  end

  it "renders new participation form" do
    render

    assert_select "form[action=?][method=?]", participations_path, "post" do

      assert_select "input#participation_role_id[name=?]", "participation[role_id]"

      assert_select "input#participation_user_id[name=?]", "participation[user_id]"

      assert_select "input#participation_project_id[name=?]", "participation[project_id]"
    end
  end
end
