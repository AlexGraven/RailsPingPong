require 'rails_helper'

RSpec.describe GameRatingsCalculator, type: :service do

    describe "Rating players" do
      subject {GameRatingsCalculator.new}

      context "Game has a winner" do
        it 'adjusts the ratings for players' do
          game = FactoryGirl.create(:game, :complete_failure_p1)

          expect(game.player_1).to receive(:update_attribute)
          expect(game.player_2).to receive(:update_attribute)

          #TODO
          #ELO moves ranges slowly over time, and doesn't tick the needle much per game.
          #we cannot test expect{subject.score_game(game)}.to change{game.player_1.grade} to work.
          #a better algorithm needs to be used.

          subject.score_game(game)
          end

        it 'does not increment beyond 100' do
          game = FactoryGirl.create(:game, :godlike_p1)
          expect{subject.score_game(game)}.to_not change{game.player_1.grade}
        end

        it 'does not decrement below 0' do
          game = FactoryGirl.create(:game, :player_1_loses, :complete_failure_p1)
          expect{subject.score_game(game)}.to_not change{game.player_1.grade}
        end
      end

      context "Game was tied" do

        it 'leaves scores unchanged' do
          game = FactoryGirl.create(:game, :tied)
          expect{subject.score_game(game)}.to_not change{game.player_1.grade}
          expect{subject.score_game(game)}.to_not change{game.player_2.grade}
        end

      end
    end

end
