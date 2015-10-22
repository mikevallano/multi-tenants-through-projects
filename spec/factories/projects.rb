FactoryGirl.define do
  factory :project do
    name {Faker::Hacker.adjective}
    account {FactoryGirl.create(:account)}
  end

end