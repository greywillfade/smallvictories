require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "A user should enter a first name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty? 	
  end

  test "A user should enter a last name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty? 	
  end

  test "A user should enter a profile name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty? 	
  end

  test "A user should have a unique profile name" do 
  	user = User.new
  	user.profile_name = users(:testsally).profile_name
  	
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "A user should have a profile name without spaces" do
  	user = User.new(first_name: 'Sally', last_name: 'J', email: 'sallytest2@gmail.com')
    user.password = user.password_confirmation = 'sdsaafdsfs'
    
  	user.profile_name = "My profile with spaces"

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("must be formatted without spaces")
  end

  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: 'Sally', last_name: 'J', email: 'sallytest2@gmail.com')
    user.password = user.password_confirmation = 'sdsaafdsfs'

    user.profile_name = 'sj1'
    assert user.valid?
  end

end
