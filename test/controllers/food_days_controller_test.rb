require 'test_helper'

class FoodDaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_day = food_days(:one)
  end

  test "should get index" do
    get food_days_url
    assert_response :success
  end

  test "should get new" do
    get new_food_day_url
    assert_response :success
  end

  test "should create food_day" do
    assert_difference('FoodDay.count') do
      post food_days_url, params: { food_day: { day: @food_day.day, description: @food_day.description, food_id: @food_day.food_id, moment: @food_day.moment, plan_id: @food_day.plan_id, weight: @food_day.weight } }
    end

    assert_redirected_to food_day_url(FoodDay.last)
  end

  test "should show food_day" do
    get food_day_url(@food_day)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_day_url(@food_day)
    assert_response :success
  end

  test "should update food_day" do
    patch food_day_url(@food_day), params: { food_day: { day: @food_day.day, description: @food_day.description, food_id: @food_day.food_id, moment: @food_day.moment, plan_id: @food_day.plan_id, weight: @food_day.weight } }
    assert_redirected_to food_day_url(@food_day)
  end

  test "should destroy food_day" do
    assert_difference('FoodDay.count', -1) do
      delete food_day_url(@food_day)
    end

    assert_redirected_to food_days_url
  end
end
