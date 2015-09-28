require 'rails_helper'

RSpec.describe "participations/index", type: :view do
  before(:each) do
    assign(:participations, [
      Participation.create!(
        :role => nil,
        :user => nil,
        :project => nil
      ),
      Participation.create!(
        :role => nil,
        :user => nil,
        :project => nil
      )
    ])
  end

  it "renders a list of participations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
