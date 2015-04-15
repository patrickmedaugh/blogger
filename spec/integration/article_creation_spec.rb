require 'rails_helper'

Rspec.describe "User creates an article" do
  context 'with valid attributes' do
    it 'saves and displays the article' do
      visit new_article_path
      fill_in "article[title]", with: "Yes"
      fill_in "article[body]", with: "No"
      click_link_or_button "Create Article"
      expect(page).to have_content?("Yes")
      expect(page).to have_content?("No")
    end
  end

  context 'without a title' do
  end
end
