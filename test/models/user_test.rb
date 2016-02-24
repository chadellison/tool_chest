require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_a_user_has_many_tools
    jones = User.new(name: "Jones")
    assert jones.tools
  end
end
