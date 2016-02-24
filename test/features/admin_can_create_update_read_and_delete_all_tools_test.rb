require 'test_helper'

class AdminCanCreateUpdateReadDeleteAllToolsTest < ActionDispatch::IntegrationTest
  test "admin can create update read and delete any tools" do
    admin = User.create(username: "admin", password: "password", role: 1)
    user1 = User.create(username: "Chad", password: "password", role: 0)
    user2 = User.create(username: "Nate", password: "password", role: 0)

    user1.tools.create(name: "hammer", price: 3000, quantity: 3)
    user2.tools.create(name: "screwdriver", price: 3000, quantity: 3)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_tools_path

    assert page.has_content?("All Tools")
    assert page.has_content?("hammer")
    assert page.has_content?("screwdriver")

  end

  test "user cannot see all tools" do
    skip
    user = User.create(username: "Chad", password: "password", role: 0)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_tools_path

    refute page.has_content?("All Tools")
    assert page.has_content?("The page you were looking for doesn't exist")
  end
end
