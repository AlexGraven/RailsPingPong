FactoryGirl.define do
  factory :game do
    player_1_score 13
    player_2_score 12
    association :player_1, factory: :player
    association :player_2, factory: :player
  end

  trait :tied do
    player_1_score 12
    player_2_score 12
  end

  trait :player_1_loses do
    player_1_score 4
    player_2_score 12
  end

  trait :godlike_p1 do
    association :player_1, factory: [:player, :godlike]
  end

  trait :complete_failure_p1 do
    association :player_1, factory: [:player, :complete_failure]
  end
end
