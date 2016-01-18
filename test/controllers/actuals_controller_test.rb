require 'test_helper'

class ActualsControllerTest < ActionController::TestCase
  setup do
    @actual = actuals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actuals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create actual" do
    assert_difference('Actual.count') do
      post :create, actual: { autor: @actual.autor, bajada: @actual.bajada, categoria_id: @actual.categoria_id, contenido: @actual.contenido, imagen_url: @actual.imagen_url, titulo: @actual.titulo }
    end

    assert_redirected_to actual_path(assigns(:actual))
  end

  test "should show actual" do
    get :show, id: @actual
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @actual
    assert_response :success
  end

  test "should update actual" do
    patch :update, id: @actual, actual: { autor: @actual.autor, bajada: @actual.bajada, categoria_id: @actual.categoria_id, contenido: @actual.contenido, imagen_url: @actual.imagen_url, titulo: @actual.titulo }
    assert_redirected_to actual_path(assigns(:actual))
  end

  test "should destroy actual" do
    assert_difference('Actual.count', -1) do
      delete :destroy, id: @actual
    end

    assert_redirected_to actuals_path
  end
end
