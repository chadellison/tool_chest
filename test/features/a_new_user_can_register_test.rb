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

    assert page.has_content? "Login"
    assert page.has_content? "Registration Successful!"
    assert_equal root_path, current_path
  end
end
