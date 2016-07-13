class GameRatingsCalculator
  #TODO this is not really a class, it doesn't maintain state. Fix it.

  ELO_RANGE = 3400
  APPLICATION_RANGE = 100

  def score_game(game)
    return if game.tie_game?
    match = EloRating::Match.new
    match.add_player(rating: convert_to_ELO(game.player_1.grade),
                     winner: game.player_1_winner?)
    match.add_player(rating: convert_to_ELO(game.player_2.grade),
                     winner: game.player_2_winner?)
    adjust_player_ratings(game, match.updated_ratings)
  end

  private

    def adjust_player_ratings(game, results)
      game.player_1.update_attribute(:grade, convert_from_ELO(results.first))
      game.player_2.update_attribute(:grade, convert_from_ELO(results.last))
    end

    def convert_from_ELO(score)
      scale_number(score, ELO_RANGE, APPLICATION_RANGE)
    end

    def convert_to_ELO(score)
      scale_number(score, APPLICATION_RANGE, ELO_RANGE)
    end

    def scale_number(score, old_range, new_range)
      (score * new_range) / old_range
    end
end
