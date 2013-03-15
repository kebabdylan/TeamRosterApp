require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "full name" do 
  	assert_equal "Jon Arp", members(:ja).full_name
    assert_equal "Lily Arp", members(:la).full_name
  end

  test "teams for member" do
  	assert_equal 2, members(:ja).teams.length
  	assert_equal 1, members(:la).teams.length
  end

  test "projects for member" do
    puts "projects for member one are.."
  
    assert_equal 2, members(:ja).projects.length
    assert_equal 1, members(:la).projects.length
    assert_instance_of Project, members(:ja).projects[0]
  end


end
