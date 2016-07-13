FactoryGirl.define do
  factory :game do
    player_1_score 13
    player_2_score 12
    association :player_1, factory: :player
    association :player_2, factory: :player 
  end
end
