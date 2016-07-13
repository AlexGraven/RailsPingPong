FactoryGirl.define do
  factory :player do
    name { Faker::Name.name }
    email {Faker::Internet.free_email}
    hand 'Right'
    grade 50
  end
end
