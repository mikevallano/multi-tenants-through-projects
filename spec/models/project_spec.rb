require 'rails_helper'

RSpec.describe Project, :type => :model do
  let(:project) { FactoryGirl.build(:project) }


  it "responds to name" do
    expect(project).to respond_to(:name)
    puts "Project name: #{project.name}"
  end

  it "responds to account" do
    expect(project).to respond_to(:account)
    puts "Project's account: #{project.account.name}"
  end

  # it "responds to subdomain" do
  #   expect(project).to respond_to(:name)
  # end

  # it { should_not validate_presence_of :name }

  # it { should validate_uniqueness_of :subdomain }


end