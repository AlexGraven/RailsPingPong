require 'rails_helper'

RSpec.describe Player, type: :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:hand) }
  it { should validate_presence_of(:grade) }
  it { should validate_numericality_of(:grade)}
  it { should validate_inclusion_of(:hand)
                                  .in_array(['Right', 'Left'])}

end
