json.extract! student, :id, :student_name, :student_age, :student_address, :created_at, :updated_at
json.url student_url(student, format: :json)
