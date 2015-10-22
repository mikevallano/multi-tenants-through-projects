FactoryGirl.define do
  factory :post do
    name { Faker::Lorem.words(3) } #putting the faker call inside a block means it'll be called each time.
    description { Faker::Lorem.sentence(3) }
    project { FactoryGirl.create(:project) }
  end

end