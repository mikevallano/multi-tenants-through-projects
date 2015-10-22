require 'rails_helper'

RSpec.describe User, :type => :model do

  let(:user) { FactoryGirl.build(:user)}

  it "responds to email" do
    expect(user).to respond_to(:email)
  end

  it { should validate_presence_of :password }



end #final ender