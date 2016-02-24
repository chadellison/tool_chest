require 'test_helper'

class ANewUserCanRegisterTest < ActionDispatch::IntegrationTest

  jones = User.new(name: "Jones")
  visit '/'


end
