require 'test_helper'

class ExerciseDaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise_day = exercise_days(:one)
  end

  test "should get index" do
    get exercise_days_url
    assert_response :success
  end

  test "should get new" do
    get new_exercise_day_url
    assert_response :success
  end

  test "should create exercise_day" do
    assert_difference('ExerciseDay.count') do
      post exercise_days_url, params: { exercise_day: { day: @exercise_day.day, description: @exercise_day.description, exercise_id: @exercise_day.exercise_id, order: @exercise_day.order, plan_id: @exercise_day.plan_id } }
    end

    assert_redirected_to exercise_day_url(ExerciseDay.last)
  end

  test "should show exercise_day" do
    get exercise_day_url(@exercise_day)
    assert_response :success
  end

  test "should get edit" do
    get edit_exercise_day_url(@exercise_day)
    assert_response :success
  end

  test "should update exercise_day" do
    patch exercise_day_url(@exercise_day), params: { exercise_day: { day: @exercise_day.day, description: @exercise_day.description, exercise_id: @exercise_day.exercise_id, order: @exercise_day.order, plan_id: @exercise_day.plan_id } }
    assert_redirected_to exercise_day_url(@exercise_day)
  end

  test "should destroy exercise_day" do
    assert_difference('ExerciseDay.count', -1) do
      delete exercise_day_url(@exercise_day)
    end

    assert_redirected_to exercise_days_url
  end
end
