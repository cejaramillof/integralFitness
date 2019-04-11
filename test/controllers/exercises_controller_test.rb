require 'test_helper'

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise = exercises(:one)
  end

  test "should get index" do
    get exercises_url
    assert_response :success
  end

  test "should get new" do
    get new_exercise_url
    assert_response :success
  end

  test "should create exercise" do
    assert_difference('Exercise.count') do
      post exercises_url, params: { exercise: { accesso: @exercise.accesso, codice: @exercise.codice, codicegruppo1: @exercise.codicegruppo1, descrizione: @exercise.descrizione, fotoA: @exercise.fotoA, fotoB: @exercise.fotoB, fotoGA: @exercise.fotoGA, fotoGB: @exercise.fotoGB, gruppo1: @exercise.gruppo1, gruppo2: @exercise.gruppo2, immagine: @exercise.immagine, livello: @exercise.livello, mappa: @exercise.mappa, mappe: @exercise.mappe, nomeimmagine: @exercise.nomeimmagine, video: @exercise.video } }
    end

    assert_redirected_to exercise_url(Exercise.last)
  end

  test "should show exercise" do
    get exercise_url(@exercise)
    assert_response :success
  end

  test "should get edit" do
    get edit_exercise_url(@exercise)
    assert_response :success
  end

  test "should update exercise" do
    patch exercise_url(@exercise), params: { exercise: { accesso: @exercise.accesso, codice: @exercise.codice, codicegruppo1: @exercise.codicegruppo1, descrizione: @exercise.descrizione, fotoA: @exercise.fotoA, fotoB: @exercise.fotoB, fotoGA: @exercise.fotoGA, fotoGB: @exercise.fotoGB, gruppo1: @exercise.gruppo1, gruppo2: @exercise.gruppo2, immagine: @exercise.immagine, livello: @exercise.livello, mappa: @exercise.mappa, mappe: @exercise.mappe, nomeimmagine: @exercise.nomeimmagine, video: @exercise.video } }
    assert_redirected_to exercise_url(@exercise)
  end

  test "should destroy exercise" do
    assert_difference('Exercise.count', -1) do
      delete exercise_url(@exercise)
    end

    assert_redirected_to exercises_url
  end
end
