require "application_system_test_case"

class MyCoursesTest < ApplicationSystemTestCase
  setup do
    @my_course = my_courses(:one)
  end

  test "visiting the index" do
    visit my_courses_url
    assert_selector "h1", text: "My Courses"
  end

  test "creating a My course" do
    visit my_courses_url
    click_on "New My Course"

    fill_in "Course", with: @my_course.course_id
    fill_in "User", with: @my_course.user_id
    click_on "Create My course"

    assert_text "My course was successfully created"
    click_on "Back"
  end

  test "updating a My course" do
    visit my_courses_url
    click_on "Edit", match: :first

    fill_in "Course", with: @my_course.course_id
    fill_in "User", with: @my_course.user_id
    click_on "Update My course"

    assert_text "My course was successfully updated"
    click_on "Back"
  end

  test "destroying a My course" do
    visit my_courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "My course was successfully destroyed"
  end
end
