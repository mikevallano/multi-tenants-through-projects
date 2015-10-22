require 'rails_helper'

RSpec.describe Account, :type => :model do
  let(:account) { FactoryGirl.build(:account) }


  it "responds to name" do
    expect(account).to respond_to(:name)
    # puts "Account name: #{account.name}"
    # puts "Account subdomain: #{account.subdomain}"
  end

  it "responds to subdomain" do
    expect(account).to respond_to(:name)
  end

  it { should_not validate_presence_of :name }

  it { should validate_uniqueness_of :subdomain }


end
