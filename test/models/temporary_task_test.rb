require 'test_helper'

class TemporaryTaskTest < ActiveSupport::TestCase

	setup do
  		@list = List.create(name: "lista 1")
 	end

	test "Sin ningún dato" do
	  	@temporary_task = TemporaryTask.new
	  	assert_not @temporary_task.save
	end

	test "Con datos válidos" do
		@temporary_task = TemporaryTask.new(
			description: "tarea temporal", 
			priority: 0, 
			state: "hecha", 
			start: Date.new(2016,10,26),
			finish: Date.new(2016,12,26),
			list_id: @list.id
			)
	  	assert (@temporary_task.save)
 	end

 	test "rango de validez invertido" do
 		start =  Date.new(2016,12,26)
 		finish = Date.new(2016,01,01)
 		@temporary_task = TemporaryTask.new(
			description: "tarea temporal", 
			priority: 0, 
			state: "hecha", 
			start: start,
			finish: finish ,
			list_id: @list.id
			)
	  	assert (@temporary_task.save)
	  	assert (@temporary_task.finish == start)
	  	assert (@temporary_task.start == finish)
 	end

 	test "pasaje a estado expirada" do
 		@temporary_task = TemporaryTask.new(
			description: "tarea temporal", 
			priority: 0, 
			state: "hecha", 
			start: Date.new(2016,9,26),
			finish: Date.new(2016,10,26),
			list_id: @list.id
			)
	  	assert (@temporary_task.save)
	  	assert (@temporary_task.state == "expirada")
 	end
end
 
