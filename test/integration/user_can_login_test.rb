require 'test_helper'

class UserCanLoginTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  # # user visits homepage
  test "user sees welcome message" do

    user = User.create(username: "Brock", password: "password")

    visit '/'
    click_on "Login"
    fill_in "Username", with: "Brock"
    fill_in "Password", with: "password"
    click_on "Login"
    assert page.has_content? "Welcome, Brock"
    assert_equal "/users/#{user.id}", current_path
  end
end
