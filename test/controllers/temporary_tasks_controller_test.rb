require 'test_helper'

class TemporaryTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temporary_task = temporary_tasks(:one)
  end

  test "should get index" do
    get temporary_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_temporary_task_url
    assert_response :success
  end

  test "should create temporary_task" do
    assert_difference('TemporaryTask.count') do
      post temporary_tasks_url, params: { temporary_task: { description: @temporary_task.description, finish: @temporary_task.finish, list_id: @temporary_task.list_id, priority: @temporary_task.priority, progress: @temporary_task.progress, start: @temporary_task.start, state: @temporary_task.state, type: @temporary_task.type } }
    end

    assert_redirected_to temporary_task_url(TemporaryTask.last)
  end

  test "should show temporary_task" do
    get temporary_task_url(@temporary_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_temporary_task_url(@temporary_task)
    assert_response :success
  end

  test "should update temporary_task" do
    patch temporary_task_url(@temporary_task), params: { temporary_task: { description: @temporary_task.description, finish: @temporary_task.finish, list_id: @temporary_task.list_id, priority: @temporary_task.priority, progress: @temporary_task.progress, start: @temporary_task.start, state: @temporary_task.state, type: @temporary_task.type } }
    assert_redirected_to temporary_task_url(@temporary_task)
  end

  test "should destroy temporary_task" do
    assert_difference('TemporaryTask.count', -1) do
      delete temporary_task_url(@temporary_task)
    end

    assert_redirected_to temporary_tasks_url
  end

end