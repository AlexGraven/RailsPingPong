require 'rails_helper'

RSpec.describe Player, type: :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:hand) }
  it { should validate_presence_of(:grade) }
  it { should validate_numericality_of(:grade)}
  it { should validate_inclusion_of(:hand)
                                  .in_array(['Right', 'Left'])}

  it 'approves valid email' do
    expect(FactoryGirl.create(:player)).to be_valid
  end

  it 'rejects invalid email' do
    expect(FactoryGirl.build(:player, :with_invalid_email).valid?).to be false
  end


end
