require 'test_helper'

class AdminCanDeleteACategoryTest < ActionDispatch::IntegrationTest
  test "the admin sees all categories minus the deleted one" do
    admin = User.create(username: "jones", password: "password", role: 1)
    category = Category.create(title: "Saw")
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_categories_path

    click_on "Saw"
    assert_equal category_path, current_path

    click_on "Delete"
    assert_equal admin_categories_path, current_path
    refute page.has_content?("Saw")
  end
end
