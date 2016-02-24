require 'test_helper'

class ANewUserCanRegisterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "new user sees welcome message" do

    visit '/'
    click_on "Create Account"
    fill_in "Username", with: "Jones"
    fill_in "Password", with: "password"
    click_on "Submit"

    jones = User.last

    assert page.has_content? "Welcome, #{jones.username}"
    assert_equal "/users/#{jones.id}", current_path
  end
end
