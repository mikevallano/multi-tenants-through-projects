require 'rails_helper'

RSpec.describe "participations/show", type: :view do
  before(:each) do
    @participation = assign(:participation, Participation.create!(
      :role => nil,
      :user => nil,
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
