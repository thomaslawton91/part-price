require 'test_helper'

class Mocha::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Mocha
  end
end
