require "rails_helper"

RSpec.describe "Discover Movie Page", tupe: :feature do
  describe "top rated movies button" do
    it "displays a button that can take you to top rated movies", :vcr do
      user_1 = User.create!(user_name: "Pal", email: "pal@email.com", password: 'password123', password_confirmation: 'password123')

      visit discover_index_path
      expect(page).to have_button("Find Top Rated Movies")

      click_button "Find Top Rated Movies"
      expect(current_path).to eq(movies_path)
    end

    it "displays a search bar to find movies with a keyword", :vcr do
      user_1 = User.create!(user_name: "Pal", email: "pal@email.com", password: 'password123', password_confirmation: 'password123')

      visit discover_index_path
      expect(page).to have_field("search")
      expect(page).to have_button("Find Movies")

      fill_in "search", with: "Batman"
      click_on "Find Movies"
      expect(current_path).to eq(movies_path)
    end
  end
end