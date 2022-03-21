json.extract! my_course, :id, :user_id, :course_id, :created_at, :updated_at
json.url my_course_url(my_course, format: :json)
