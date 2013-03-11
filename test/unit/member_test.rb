require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "full name" do 
  	assert_equal "Peter Pumpkin", members(:one).full_name
  end

  test "teams for member" do
  	assert_equal 2, members(:one).teams.length
  	assert_equal 1, members(:two).teams.length
  end
end
