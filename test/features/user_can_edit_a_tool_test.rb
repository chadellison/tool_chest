require 'test_helper'

class UserCanEditAToolTest < ActionDispatch::IntegrationTest
  test "user can edit an existing tool" do
    tool = Tool.create(name: "screwdriver", quantity: 10, price: 10000)
    user = User.create(username: "Jones", password: "password")
    user.tools << tool

    visit root_path
    click_on "Login"
    fill_in "Username", with: "Jones"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "Edit"
    fill_in "Name", with: "wrench"
    fill_in "tool[quantity]", with: 11
    fill_in "tool[price]", with: 2000

    click_link_or_button "Update Tool"

    assert_equal current_path, user_path(user)

    within(".tool_info") do
      assert page.has_content?("wrench")
      assert page.has_content?("11")
      assert page.has_content?("200")
    end

  end
end
