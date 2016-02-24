require 'test_helper'

class ToolTest < ActiveSupport::TestCase
  def test_a_tool_belongs_to_a_user
    jones = User.create(name: "Jones")
    tool = Tool.create(name: "sludge hammer")

    assert_equal false, jones.id == tool.user_id
    jones.tools << tool
    assert_equal jones.id, tool.user_id
  end
end
