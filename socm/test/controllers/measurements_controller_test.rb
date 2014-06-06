require 'test_helper'

class MeasurementsControllerTest < ActionController::TestCase
  setup do
    @measurement = measurements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:measurements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create measurement" do
    assert_difference('Measurement.count') do
      post :create, measurement: { r: @measurement.r, r_err_max: @measurement.r_err_max, r_err_min: @measurement.r_err_min, vrot_data: @measurement.vrot_data, vrot_data_err_max: @measurement.vrot_data_err_max, vrot_data_err_min: @measurement.vrot_data_err_min }
    end

    assert_redirected_to measurement_path(assigns(:measurement))
  end

  test "should show measurement" do
    get :show, id: @measurement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @measurement
    assert_response :success
  end

  test "should update measurement" do
    patch :update, id: @measurement, measurement: { r: @measurement.r, r_err_max: @measurement.r_err_max, r_err_min: @measurement.r_err_min, vrot_data: @measurement.vrot_data, vrot_data_err_max: @measurement.vrot_data_err_max, vrot_data_err_min: @measurement.vrot_data_err_min }
    assert_redirected_to measurement_path(assigns(:measurement))
  end

  test "should destroy measurement" do
    assert_difference('Measurement.count', -1) do
      delete :destroy, id: @measurement
    end

    assert_redirected_to measurements_path
  end
end
