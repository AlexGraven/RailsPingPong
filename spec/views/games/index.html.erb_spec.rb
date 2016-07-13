require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    assign(:games, FactoryGirl.create_list(:game, 2))
  end

  it "renders a list of games" do
    render
  end
end
