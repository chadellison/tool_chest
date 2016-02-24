require 'test_helper'

class UserCanLogoutTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user sees home page" do
    user = User.create(username: "Brock", password: "password")

    visit '/'
    click_on "Login"
    fill_in "Username", with: "Brock"
    fill_in "Password", with: "password"
    click_on "Login"
    assert page.has_content? "Welcome, Brock"
    assert_equal "/users/#{user.id}", current_path

    click_on "Logout"

    assert_equal root_path, current_path
    assert page.has_no_content? "Welcome, #{user.username}"



  end

end
