require 'rails_helper'

RSpec.describe Game, type: :model do

  it {should belong_to(:player_1)}
  it {should belong_to(:player_2)}

  it {should validate_presence_of(:player_1_score)}
  it {should validate_numericality_of(:player_1_score)}
  it {should validate_presence_of(:player_2_score)}
  it {should validate_numericality_of(:player_2_score)}

  describe 'Game winner' do

     it "returns winner" do
       game = FactoryGirl.create(:game)
       expect(game.winner).to eq game.player_1
     end

     it "returns nil if tied" do
       game = FactoryGirl.create(:game, :tied)
       expect(game.winner).to eq nil
     end

  end

  describe 'Tie game' do

    it 'returns true if tied' do
      game = FactoryGirl.create(:game, :tied)
      expect(game.tie_game?).to be true
    end

    it 'returns false if there is a winner' do
      game = FactoryGirl.create(:game)
      expect(game.tie_game?).to be false
    end

  end

end
