FactoryGirl.define do
  factory :player do
    name { Faker::Name.name }
    email {Faker::Internet.free_email}
    hand 'Right'
    grade 50
  end

  trait :godlike do
    grade 100
  end

  trait :complete_failure do
    grade 0
  end
end
