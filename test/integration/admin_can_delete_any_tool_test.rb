require 'test_helper'

class AdminCanDeleteAnyToolTest < ActionDispatch::IntegrationTest
  test "the admin has access to all tools" do
    admin = User.create(username: "jones", password: "password", role: 1)
    user = User.create(username: "bill", password: "password", role: 0)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit user_path(user.id)

    click_on "Add Tool"
    fill_in "Name", with: "saw"
    fill_in "Price", with: 10000
    fill_in "Quantity", with: 1
    click_on "Create Tool"

    assert_equal user_path(user.id), current_path
    assert page.has_content?("saw")
    click_on "Logout"

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_tools_path
    click_on "saw"
    click_on "Delete"

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit user_path(user.id)
    refute page.has_content?("saw")
  end
end
