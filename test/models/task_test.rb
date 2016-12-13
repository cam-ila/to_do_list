require 'test_helper'

class TaskTest < ActiveSupport::TestCase

	setup do
  		@list = lists(:one)
  	end
	
	test "ordenar por prioridad" do
		priorities = @list.task.map{|t| t.priority}
		assert [priorities == priorities.sort]
	end
	

end
