require "application_system_test_case"

class ExercisesTest < ApplicationSystemTestCase
  setup do
    @exercise = exercises(:one)
  end

  test "visiting the index" do
    visit exercises_url
    assert_selector "h1", text: "Exercises"
  end

  test "creating a Exercise" do
    visit exercises_url
    click_on "New Exercise"

    fill_in "Accesso", with: @exercise.accesso
    fill_in "Codice", with: @exercise.codice
    fill_in "Codicegruppo1", with: @exercise.codicegruppo1
    fill_in "Descrizione", with: @exercise.descrizione
    fill_in "Fotoa", with: @exercise.fotoA
    fill_in "Fotob", with: @exercise.fotoB
    fill_in "Fotoga", with: @exercise.fotoGA
    fill_in "Fotogb", with: @exercise.fotoGB
    fill_in "Gruppo1", with: @exercise.gruppo1
    fill_in "Gruppo2", with: @exercise.gruppo2
    fill_in "Immagine", with: @exercise.immagine
    fill_in "Livello", with: @exercise.livello
    fill_in "Mappa", with: @exercise.mappa
    fill_in "Mappe", with: @exercise.mappe
    fill_in "Nomeimmagine", with: @exercise.nomeimmagine
    fill_in "Video", with: @exercise.video
    click_on "Create Exercise"

    assert_text "Exercise was successfully created"
    click_on "Back"
  end

  test "updating a Exercise" do
    visit exercises_url
    click_on "Edit", match: :first

    fill_in "Accesso", with: @exercise.accesso
    fill_in "Codice", with: @exercise.codice
    fill_in "Codicegruppo1", with: @exercise.codicegruppo1
    fill_in "Descrizione", with: @exercise.descrizione
    fill_in "Fotoa", with: @exercise.fotoA
    fill_in "Fotob", with: @exercise.fotoB
    fill_in "Fotoga", with: @exercise.fotoGA
    fill_in "Fotogb", with: @exercise.fotoGB
    fill_in "Gruppo1", with: @exercise.gruppo1
    fill_in "Gruppo2", with: @exercise.gruppo2
    fill_in "Immagine", with: @exercise.immagine
    fill_in "Livello", with: @exercise.livello
    fill_in "Mappa", with: @exercise.mappa
    fill_in "Mappe", with: @exercise.mappe
    fill_in "Nomeimmagine", with: @exercise.nomeimmagine
    fill_in "Video", with: @exercise.video
    click_on "Update Exercise"

    assert_text "Exercise was successfully updated"
    click_on "Back"
  end

  test "destroying a Exercise" do
    visit exercises_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exercise was successfully destroyed"
  end
end
