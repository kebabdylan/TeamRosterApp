require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "full name" do 
  	assert_equal "Peter Pumpkin", members(:one).full_name
  end
end
