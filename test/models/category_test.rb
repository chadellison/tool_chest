require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def test_it_has_many_tools
    category = Category.create(title: "Saw")
    tool = Tool.create(name: "hack saw")

    assert_equal false, category.id == tool.category_id
    category.tools << tool
    assert_equal category.id, tool.category_id
  end

  def test_a_tool_belongs_to_a_category
    category = Category.create(title: "power tools")
    tool = Tool.create(name: "electric drill")

    assert_equal false, category.id == tool.user_id
    category.tools << tool
    assert_equal category.id, tool.category_id
  end

end
