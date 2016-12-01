json.extract! simple_task, :id, :description, :state, :priority, :type, :list_id, :created_at, :updated_at
json.url simple_task_url(simple_task, format: :json)