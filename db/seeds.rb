# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

lists = List.create([{name: "Lista 0", url: "lista-0"}, {name: "Lista 1", url: "lista-1"}])

simple_tasks = SimpleTask.create([
	{description: "soy tarea simple, con prioridad alta" ,state: "pendiente" , priority: 0 , list: lists[0]  },
	{description: "soy tarea simple, con prioridad media" ,state: "pendiente" , priority: 1 , list: lists[0]   },
	{description: "soy tarea simple, con prioridad baja" ,state: "hecha" , priority: 2 , list: lists[0]   },
	{description: "soy tarea simple, con prioridad alta" ,state: "pendiente" , priority: 0 , list: lists[1]   },
	{description: "soy tarea simple, con prioridad media" ,state: "pendiente", priority: 1 , list: lists[1]  },
	{description: "soy tarea simple, con prioridad baja",state: "hecha" , priority: 2 , list: lists[1]   }
		])
temporary_tasks = TemporaryTask.create([
	{description: "soy una tarea temporal, con prioridad alta" ,state: "pendiente" , priority: 0 , list: lists[0]   , start: Date.new(2016,12,1) , finish: Date.new(2016,12,2) },
	{description: "soy una tarea temporal, con prioridad media" ,state: "hecha" , priority: 1 , list: lists[0]   , start: Date.new(2016,12,10) , finish: Date.new(2016,12,20) },
	{description: "soy una tarea temporal, con prioridad baja" ,state: "expirada" , priority: 2 , list: lists[0]  , start: Date.new(2016,11,1) , finish: Date.new(2016,12,1) },
	{description: "soy una tarea temporal, con prioridad baja" ,state: "pendiente" , priority: 2, list: lists[1]   , start: Date.new(2016,1,1) , finish: Date.new(2016,12,1) },
	{description: "soy una tarea temporal, con prioridad media" ,state: "hecha" , priority: 1, list: lists[1]   , start: Date.new(2016,10,1) , finish: Date.new(2016,11,1)},
	{description: "soy una tarea temporal, con prioridad alta" ,state: "expirada" , priority: 0 , list: lists[1]   , start: Date.new(2016,12,1) , finish: Date.new(2016,12,2) }
	])


long_tasks= LongTask.create([
	{description: "Soy una tarea larga, con prioridad alta" ,state: "en_curso" , priority: 0 , list: lists[0]  , progress: 10},
	{description: "Soy una tarea larga, con prioridad media" ,state: "en_curso" , priority: 1 , list: lists[0] , progress: 20},
	{description: "Soy una tarea larga, con prioridad baja" ,state:"pendiente" , priority: 2 , list: lists[0]  , progress: 0},
	{description: "Soy una tarea larga, con prioridad baja" ,state:"hecha" , priority: 2 , list: lists[1]  , progress: 100},
	{description: "Soy una tarea larga, con prioridad media" ,state: "en_curso" , priority: 1 , list: lists[1]   , progress: 9},
	{description: "Soy una tarea larga, con prioridad alta" ,state: "en_curso" , priority: 0 , list: lists[1]  , progress: 5}
	])
