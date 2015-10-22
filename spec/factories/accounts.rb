FactoryGirl.define do
  factory :account do
    name {Faker::Company.name}
    subdomain {Faker::Lorem.word.downcase}
  end

end