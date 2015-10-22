require 'rails_helper'

RSpec.describe Post do

  let(:post) { FactoryGirl.build(:post) }

  it 'responds to name' do
    expect(post).to respond_to(:name)
  end

  it "has a project that it belongs to" do
    expect(post).to respond_to(:project)
  end


end
