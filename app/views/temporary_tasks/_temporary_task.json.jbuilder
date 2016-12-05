json.extract! temporary_task, :id, :description, :state, :priority, :start, :finish, :type, :list_id, :created_at, :updated_at
json.url temporary_task_url(temporary_task, format: :json)