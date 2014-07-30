require "rails_helper"
feature "Accounts" do
  scenario "Subdomain with restricted name" do
      visit subscribem.root_path
      click_link "Account Sign Up"
      fill_in "Name", :with => "Test"
      fill_in "Subdomain", :with => "admin"
      fill_in "Email", :with => "subscribem@example.com"
      fill_in "Password", :with => "password"
      fill_in "Password confirmation", :with => "password"
      click_button "Create Account"

      expect(page.current_url).to eq("http://www.example.com/subscribem/accounts")
      expect(page).to have_content("Sorry, your account could not be created.")
      expect(page).to have_content("Subdomain is not allowed. Please choose another subdomain.")
    end
end