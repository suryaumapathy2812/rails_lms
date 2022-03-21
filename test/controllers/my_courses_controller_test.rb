require "test_helper"

class MyCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_course = my_courses(:one)
  end

  test "should get index" do
    get my_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_my_course_url
    assert_response :success
  end

  test "should create my_course" do
    assert_difference('MyCourse.count') do
      post my_courses_url, params: { my_course: { course_id: @my_course.course_id, user_id: @my_course.user_id } }
    end

    assert_redirected_to my_course_url(MyCourse.last)
  end

  test "should show my_course" do
    get my_course_url(@my_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_course_url(@my_course)
    assert_response :success
  end

  test "should update my_course" do
    patch my_course_url(@my_course), params: { my_course: { course_id: @my_course.course_id, user_id: @my_course.user_id } }
    assert_redirected_to my_course_url(@my_course)
  end

  test "should destroy my_course" do
    assert_difference('MyCourse.count', -1) do
      delete my_course_url(@my_course)
    end

    assert_redirected_to my_courses_url
  end
end
