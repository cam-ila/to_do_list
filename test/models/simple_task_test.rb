require 'test_helper'

class SimpleTaskTest < ActiveSupport::TestCase

	setup do
  		@list = List.create(name: "lista 1")
 	end

	test "Sin ningún dato" do
	  	@simple_task = SimpleTask.new
	  	assert_not @simple_task.save
	end

	test "Con datos válidos" do
		@simple_task = SimpleTask.new(description: "tarea simple", priority: 0, state: "hecha", list_id: @list.id)
	  	assert (@simple_task.save)
 	end
end