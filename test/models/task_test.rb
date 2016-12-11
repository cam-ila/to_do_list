require 'test_helper'

class TaskTest < ActiveSupport::TestCase

	setup do
  		@list = lists(:one)
  	end
	
	test "ordenar por prioridad" do
		assert_not (@list.task_by_priority == @list.task)
	end
	

end
