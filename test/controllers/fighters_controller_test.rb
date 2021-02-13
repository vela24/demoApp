require 'test_helper'

class FightersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fighter = fighters(:one)
  end

  test "should get index" do
    get fighters_url
    assert_response :success
  end

  test "should get new" do
    get new_fighter_url
    assert_response :success
  end

  test "should create fighter" do
    assert_difference('Fighter.count') do
      post fighters_url, params: { fighter: { bio: @fighter.bio, email: @fighter.email, first_name: @fighter.first_name, last_name: @fighter.last_name, phone: @fighter.phone } }
    end

    assert_redirected_to fighter_url(Fighter.last)
  end

  test "should show fighter" do
    get fighter_url(@fighter)
    assert_response :success
  end

  test "should get edit" do
    get edit_fighter_url(@fighter)
    assert_response :success
  end

  test "should update fighter" do
    patch fighter_url(@fighter), params: { fighter: { bio: @fighter.bio, email: @fighter.email, first_name: @fighter.first_name, last_name: @fighter.last_name, phone: @fighter.phone } }
    assert_redirected_to fighter_url(@fighter)
  end

  test "should destroy fighter" do
    assert_difference('Fighter.count', -1) do
      delete fighter_url(@fighter)
    end

    assert_redirected_to fighters_url
  end
end
