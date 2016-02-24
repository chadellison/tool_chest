require 'test_helper'

class AdminCanCreateUpdateReadDeleteAllToolsTest < ActionDispatch::IntegrationTest
  test "admin can create update read and delete any tools" do
    admin = User.create(username: "admin", password: "password", role: 1)
    
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_tools_path

    assert page.has_content?("All Tools")



  end
end
