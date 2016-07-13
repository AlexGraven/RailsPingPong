require 'rails_helper'

RSpec.describe GameRatingsCalculator, type: :service do

    describe "Rating players" do
      subject {GameRatingsCalculator.new}

      context "Game has a winner" do
        it 'adjusts the ratings for players' do
          game = FactoryGirl.create(:game)

          expect(subject.score_game(game)).to change(game.player_1.score).by_at_least(1)
          expect(subject.score_game(game)).to change(game.player_1.score).by_at_least(-1)

        end

        it 'does not increment beyond 100' do
          game = FactoryGirl.create(:game, :godlike_p1)
          expect(subject.score_game(game)).not_to change(game.player_1.score)
        end

        it 'does not decrement below 0' do
          game = FactoryGirl.create(:game, :player_1_loses, :complete_failure_p1)
          expect(subject.score_game(game)).not_to change(game.player_1.score)
        end
      end

      context "Game was tied" do

        it 'leaves scores unchanged' do
          game = FactoryGirl.create(:game, :tied)
          expect(subject.score_game(game)).not_to change(game.player_1.score)
          expect(subject.score_game(game)).not_to change(game.player_1.score)
        end
        
      end
    end

end
