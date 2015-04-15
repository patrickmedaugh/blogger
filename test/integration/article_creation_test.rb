require 'test_helper'

class ArticleCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can create an article" do
    visit new_article_path
    fill_in "article[title]", with: "Yes"
    fill_in "article[body]", with: "No"
    click_link_or_button "Create Article"
    assert page.has_content?("Yes")
    assert page.has_content?("No")
  end

end
