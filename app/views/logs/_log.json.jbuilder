json.extract! log, :id, :user_id, :activity, :ip_address, :device_info, :browser, :location, :created_at, :updated_at
json.url log_url(log, format: :json)
