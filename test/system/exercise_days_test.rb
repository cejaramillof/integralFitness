require "application_system_test_case"

class ExerciseDaysTest < ApplicationSystemTestCase
  setup do
    @exercise_day = exercise_days(:one)
  end

  test "visiting the index" do
    visit exercise_days_url
    assert_selector "h1", text: "Exercise Days"
  end

  test "creating a Exercise day" do
    visit exercise_days_url
    click_on "New Exercise Day"

    fill_in "Day", with: @exercise_day.day
    fill_in "Description", with: @exercise_day.description
    fill_in "Exercise", with: @exercise_day.exercise_id
    fill_in "Order", with: @exercise_day.order
    fill_in "Plan", with: @exercise_day.plan_id
    click_on "Create Exercise day"

    assert_text "Exercise day was successfully created"
    click_on "Back"
  end

  test "updating a Exercise day" do
    visit exercise_days_url
    click_on "Edit", match: :first

    fill_in "Day", with: @exercise_day.day
    fill_in "Description", with: @exercise_day.description
    fill_in "Exercise", with: @exercise_day.exercise_id
    fill_in "Order", with: @exercise_day.order
    fill_in "Plan", with: @exercise_day.plan_id
    click_on "Update Exercise day"

    assert_text "Exercise day was successfully updated"
    click_on "Back"
  end

  test "destroying a Exercise day" do
    visit exercise_days_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exercise day was successfully destroyed"
  end
end
