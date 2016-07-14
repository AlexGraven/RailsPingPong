require "rails_helper"

#spec says create at least one
#the only thing I know for sure is CRUD on both of these
#this would be thoroughly fleshed out after a tasking meeting normally

RSpec.feature "Creating a player", type: :feature do

  scenario "User creates a new player", js: true do
    
    visit "/players/new"

    fill_in "Name", with: "George Jungle"
    fill_in "Email", with: "watch@outforthat.treeeeee"
    select "Right", from: "Hand"
    fill_in "Grade", with: "50"

    click_button "Create Player"

    expect(page).to have_text("Name: George Jungle")
  end
end
