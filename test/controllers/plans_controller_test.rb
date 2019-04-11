require 'test_helper'

class PlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plan = plans(:one)
  end

  test "should get index" do
    get plans_url
    assert_response :success
  end

  test "should get new" do
    get new_plan_url
    assert_response :success
  end

  test "should create plan" do
    assert_difference('Plan.count') do
      post plans_url, params: { plan: { activity: @plan.activity, carbs: @plan.carbs, description: @plan.description, fat: @plan.fat, fat_mass: @plan.fat_mass, goal: @plan.goal, guest_id: @plan.guest_id, kcal: @plan.kcal, lean_mass: @plan.lean_mass, muscle_mass: @plan.muscle_mass, proteins: @plan.proteins, residual_mass: @plan.residual_mass, skeletal_mass: @plan.skeletal_mass, user_id: @plan.user_id, weight: @plan.weight } }
    end

    assert_redirected_to plan_url(Plan.last)
  end

  test "should show plan" do
    get plan_url(@plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_plan_url(@plan)
    assert_response :success
  end

  test "should update plan" do
    patch plan_url(@plan), params: { plan: { activity: @plan.activity, carbs: @plan.carbs, description: @plan.description, fat: @plan.fat, fat_mass: @plan.fat_mass, goal: @plan.goal, guest_id: @plan.guest_id, kcal: @plan.kcal, lean_mass: @plan.lean_mass, muscle_mass: @plan.muscle_mass, proteins: @plan.proteins, residual_mass: @plan.residual_mass, skeletal_mass: @plan.skeletal_mass, user_id: @plan.user_id, weight: @plan.weight } }
    assert_redirected_to plan_url(@plan)
  end

  test "should destroy plan" do
    assert_difference('Plan.count', -1) do
      delete plan_url(@plan)
    end

    assert_redirected_to plans_url
  end
end
