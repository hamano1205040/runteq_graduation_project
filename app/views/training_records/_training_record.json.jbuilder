json.extract! training_record, :id, :user_id, :trained_on, :content, :created_at, :updated_at
json.url training_record_url(training_record, format: :json)
