require 'rails_helper'

RSpec.describe 'Discover Dashboard' do
  before :each do
    @user1 = User.create!(user_name: "Bob", email: "bob@gmail.com")
  end

  it 'displays a button to discover top rated movies' does
    visit "/users/#{@user1.id}/discover"

    expect(page).to have_button("Find Top Rated Movies")

    click_button("Find Top Rated Movies")

    expect(current_path).to eq("/users/#{@user1.id}/movies?q=top%20rated")
  end

  it 'displays a text field to search for movies' do
    visit "/users/#{@user1.id}/discover"

    expect
  end
end