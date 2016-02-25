require 'test_helper'

class AdminCanCreateACategoryTest < ActionDispatch::IntegrationTest
  test "admin can view all categories" do
    admin = User.create(username: "Brad", password: "password", role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_categories_path

    click_on "Create Category"

    fill_in "Title", with: "power tools"

    click_on "Submit"

    assert page.has_content?("power tools")
    assert_equal admin_categories_path, current_path
  end

end
