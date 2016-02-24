require 'test_helper'

class UserCanViewAllTheirToolsTest < ActionDispatch::IntegrationTest
  require 'test_helper'

  include Capybara::DSL
    # # user visits homepage
  test "user sees all their tools" do

    user = User.create(username: "Brock", password: "password")

    visit '/'
    click_on "Login"
    fill_in "Username", with: "Brock"
    fill_in "Password", with: "password"
    click_on "Login"

    assert page.has_content? "Welcome, Brock"
    assert_equal "/users/#{user.id}", current_path

    click_on "Add Tool"
    assert_equal new_user_tool_path, current_path
    fill_in "Name", with: "jack hammer"
    fill_in "Quantity", with: 50
    fill_in "Price", with: 20000
    click_on "Create Tool"
    assert page.has_content?("jack hammer")
    assert_equal "users/#{user.id}", current_path
  end

end
