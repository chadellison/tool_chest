require 'test_helper'

class ToolTest < ActiveSupport::TestCase
  def test_a_tool_belongs_to_a_user
    jones = User.create(username: "Jones", password: "password")
    tool = Tool.create(name: "sledge hammer")

    assert_equal false, jones.id == tool.user_id
    jones.tools << tool
    assert_equal jones.id, tool.user_id
  end
end
