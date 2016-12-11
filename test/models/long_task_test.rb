require 'test_helper'

class LongTaskTest < ActiveSupport::TestCase

  setup do
  	@list = List.create(name: "lista 1")
  end

  test "Sin ningún dato" do
  	@long_task = LongTask.new
  	assert_not @long_task.save
  end

  test "Con datos válidos" do
  		@long_task = LongTask.new(
			description: "tarea larga", 
			priority: 0, 
			state: "hecha", 
			progress: 10,
			list_id: @list.id
			)
	  	assert (@long_task.save)
  end

  test "La actualización de una tarea larga con porcentajes dentro y fuera del rango válido." do
  	@long_task = LongTask.new(description: "tarea larga", priority: 0, state: "en_curso", progress: 10, list_id: @list.id )
	assert (@long_task.save)
	assert (@long_task.update(progress: 100))
	assert (@long_task.update(progress: 0))
	assert (@long_task.update(progress: 50))
	assert_not (@long_task.update(progress: -1))
	assert_not (@long_task.update(progress: 101))
	assert_not (@long_task.update(progress: -10))
  end


end

