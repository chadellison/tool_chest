require 'test_helper'

class UserCannotUpdateOtherUsersBesidesSelf < ActionDispatch::IntegrationTest
  test 'user sees only their tools' do
    user1 = User.create(username: "Chad", password: "password", role: 0)
    user1.tools.create(name: "hammer", price: 3000, quantity: 4)
    user2 = User.create(username: "Jones", password: "password", role: 0)
    user2.tools.create(name: "Screwdriver", price: 3000, quantity: 4)

    ApplicationController.any_instance.stubs(:current_user).returns(user1)

    visit user_path(user1.id)
    assert page.has_content?("hammer")
    refute page.has_content?("Screwdriver")

    click_on "Logout"

    ApplicationController.any_instance.stubs(:current_user).returns(user2)

    visit user_path(user2.id)
    assert page.has_content?("Screwdriver")
    refute page.has_content?("hammer")
  end
end
