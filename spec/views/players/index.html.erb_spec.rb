require 'rails_helper'

RSpec.describe "players/index", type: :view do
  before(:each) do
    assign(:players, FactoryGirl.create_list(:player, 3))
  end

  it "renders a list of players" do
    render
  end
end
