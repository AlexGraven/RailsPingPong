class Game < ActiveRecord::Base
  [:player_1_id, :player_2_id,
   :player_1_score, :player_2_score].each do |attribute|

    validates attribute, presence: true
    validates attribute, numericality: {only_integer: true}
  end
end
