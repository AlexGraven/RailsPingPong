class Game < ActiveRecord::Base

  [:player_1_score, :player_2_score].each do |attribute|

    validates attribute, presence: true
    validates attribute, numericality: {only_integer: true}

  end

    belongs_to :player_1, class_name: 'Player', foreign_key: 'player_1_id', required: true
    belongs_to :player_2, class_name: 'Player', foreign_key: 'player_2_id', required: true

    def winner
      return nil if tie_game?
      (player_1_score > player_2_score) ? player_1 : player_2
    end

    def tie_game?
      player_1_score == player_2_score
    end
end
