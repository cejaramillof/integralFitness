require "application_system_test_case"

class FoodDaysTest < ApplicationSystemTestCase
  setup do
    @food_day = food_days(:one)
  end

  test "visiting the index" do
    visit food_days_url
    assert_selector "h1", text: "Food Days"
  end

  test "creating a Food day" do
    visit food_days_url
    click_on "New Food Day"

    fill_in "Day", with: @food_day.day
    fill_in "Description", with: @food_day.description
    fill_in "Food", with: @food_day.food_id
    fill_in "Moment", with: @food_day.moment
    fill_in "Plan", with: @food_day.plan_id
    fill_in "Weight", with: @food_day.weight
    click_on "Create Food day"

    assert_text "Food day was successfully created"
    click_on "Back"
  end

  test "updating a Food day" do
    visit food_days_url
    click_on "Edit", match: :first

    fill_in "Day", with: @food_day.day
    fill_in "Description", with: @food_day.description
    fill_in "Food", with: @food_day.food_id
    fill_in "Moment", with: @food_day.moment
    fill_in "Plan", with: @food_day.plan_id
    fill_in "Weight", with: @food_day.weight
    click_on "Update Food day"

    assert_text "Food day was successfully updated"
    click_on "Back"
  end

  test "destroying a Food day" do
    visit food_days_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Food day was successfully destroyed"
  end
end
