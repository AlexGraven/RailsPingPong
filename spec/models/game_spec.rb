require 'rails_helper'

RSpec.describe Game, type: :model do

  it {should belong_to(:player_1)}
  it {should belong_to(:player_2)}

  it {should validate_presence_of(:player_1_score)}
  it {should validate_numericality_of(:player_1_score)}
  it {should validate_presence_of(:player_2_score)}
  it {should validate_numericality_of(:player_2_score)}

end
