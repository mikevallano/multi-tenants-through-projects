require 'rails_helper'

RSpec.describe "participations/edit", type: :view do
  before(:each) do
    @participation = assign(:participation, Participation.create!(
      :role => nil,
      :user => nil,
      :project => nil
    ))
  end

  it "renders the edit participation form" do
    render

    assert_select "form[action=?][method=?]", participation_path(@participation), "post" do

      assert_select "input#participation_role_id[name=?]", "participation[role_id]"

      assert_select "input#participation_user_id[name=?]", "participation[user_id]"

      assert_select "input#participation_project_id[name=?]", "participation[project_id]"
    end
  end
end
