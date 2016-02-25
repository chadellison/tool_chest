require 'test_helper'

class AdminCanEditACategoryTest < ActionDispatch::IntegrationTest
  test "the admin sees all categories" do
    admin = User.create(username: "jones", password: "password", role: 1)
    category = Category.create(title: "Saw")
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_categories_path

    click_on "Saw"
    assert_equal category_path(category.id), current_path

    click_on "Edit"
    fill_in "Title", with: "power tools"
    click_on "Submit"
    assert_equal admin_categories_path, current_path
    refute page.has_content?("Saw")
    assert page.has_content?("power tools")
  end
end
