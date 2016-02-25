require 'test_helper'

class AdminCanCreateEditAnyToolTest < ActionDispatch::IntegrationTest
  test "the admin sees all the tools" do
    admin = User.create(username: "frank", password: "password", role: 1)
    user = User.create(username: "jones", password: "password", role: 0)
    tool = Tool.create(name: "hammer", price: 2000, quantity: 3)
    user.tools << tool

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit user_path(user.id)
    assert page.has_content?("hammer")
    click_on "Logout"

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_tools_path
    click_on "hammer"
    click_on "Edit hammer"
    fill_in "Name", with: "drill"
    click_on "Update Tool"
    click_on "Logout"

    user = User.find(tool.user_id)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(user.id)
    refute page.has_content?("hammer")
    assert page.has_content?("drill")
    click_on "Logout"
  end
end
