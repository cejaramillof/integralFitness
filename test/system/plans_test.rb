require "application_system_test_case"

class PlansTest < ApplicationSystemTestCase
  setup do
    @plan = plans(:one)
  end

  test "visiting the index" do
    visit plans_url
    assert_selector "h1", text: "Plans"
  end

  test "creating a Plan" do
    visit plans_url
    click_on "New Plan"

    fill_in "Activity", with: @plan.activity
    fill_in "Carbs", with: @plan.carbs
    fill_in "Description", with: @plan.description
    fill_in "Fat", with: @plan.fat
    fill_in "Fat mass", with: @plan.fat_mass
    fill_in "Goal", with: @plan.goal
    fill_in "Guest", with: @plan.guest_id
    fill_in "Kcal", with: @plan.kcal
    fill_in "Lean mass", with: @plan.lean_mass
    fill_in "Muscle mass", with: @plan.muscle_mass
    fill_in "Proteins", with: @plan.proteins
    fill_in "Residual mass", with: @plan.residual_mass
    fill_in "Skeletal mass", with: @plan.skeletal_mass
    fill_in "User", with: @plan.user_id
    fill_in "Weight", with: @plan.weight
    click_on "Create Plan"

    assert_text "Plan was successfully created"
    click_on "Back"
  end

  test "updating a Plan" do
    visit plans_url
    click_on "Edit", match: :first

    fill_in "Activity", with: @plan.activity
    fill_in "Carbs", with: @plan.carbs
    fill_in "Description", with: @plan.description
    fill_in "Fat", with: @plan.fat
    fill_in "Fat mass", with: @plan.fat_mass
    fill_in "Goal", with: @plan.goal
    fill_in "Guest", with: @plan.guest_id
    fill_in "Kcal", with: @plan.kcal
    fill_in "Lean mass", with: @plan.lean_mass
    fill_in "Muscle mass", with: @plan.muscle_mass
    fill_in "Proteins", with: @plan.proteins
    fill_in "Residual mass", with: @plan.residual_mass
    fill_in "Skeletal mass", with: @plan.skeletal_mass
    fill_in "User", with: @plan.user_id
    fill_in "Weight", with: @plan.weight
    click_on "Update Plan"

    assert_text "Plan was successfully updated"
    click_on "Back"
  end

  test "destroying a Plan" do
    visit plans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plan was successfully destroyed"
  end
end
