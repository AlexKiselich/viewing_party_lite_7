require "rails_helper"

RSpec.describe "Discover Movie Page", tupe: :feature do
  describe "top rated movies button" do
    it "displays a button that can take you to top rated movies" do
      user_1 = User.create!(user_name: "Pal", email: "pal@email.com")

      visit "/users/#{user_1.id}/discover"
      expect(page).to have_button("Find Top Rated Movies")

      click_button "Find Top Rated Movies"
      expect(current_path).to eq(user_movies_path(user_1))
    end

    it "displays a search bar to find movies with a keyword" do
      user_1 = User.create!(user_name: "Pal", email: "pal@email.com")

      visit "/users/#{user_1.id}/discover"
      expect(page).to have_field("search")
      expect(page).to have_button("Find Movies")

      fill_in "search", with: "Batman"
      click_on "Find Movies"
      expect(current_path).to eq(user_movies_path(user_1))
    end
  end
end