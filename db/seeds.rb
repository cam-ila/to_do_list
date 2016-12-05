# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# priority {alta media baja}
# simple pendiente hecha
# temporary pendiente hecha expirada
#  pendiente en_curso hecha



lists = List.create([{name: "Lista 0", url: "lista-0"}, {name: "Lista 1", url: "lista-1"}])

simple_tasks = SimpleTask.create([
	{description: "tarea simple, p alta" ,state: "pendiente" , priority: "alta" , list: lists[0]  },
	{description: "tarea simple, p media" ,state: "pendiente" , priority: "media" , list: lists[0]   },
	{description: "tarea simple, p baja" ,state: "hecha" , priority: "baja" , list: lists[0]   },
	{description: "tarea simple, p alta" ,state: "pendiente" , priority: "alta" , list: lists[1]   },
	{description: "tarea simple , p media" ,state: "pendiente", priority: "media" , list: lists[1]  },
	{description: "tarea simple, p baja",state: "hecha" , priority: "baja" , list: lists[1]   }
		])
temporary_tasks = TemporaryTask.create([
	{description: "tarea temporal, p alta" ,state: "pendiente" , priority: "alta" , list: lists[0]   , start: Date.new(2016,12,1) , finish: Date.new(2016,12,2) },
	{description: "tarea temporal, p media" ,state: "hecha" , priority: "media" , list: lists[0]   , start: Date.new(2016,12,10) , finish: Date.new(2016,12,20) },
	{description: "tarea temporal, p baja" ,state: "expirada" , priority: "baja" , list: lists[0]  , start: Date.new(2016,11,1) , finish: Date.new(2016,12,1) },
	{description: "tarea temporal, p baja" ,state: "pendiente" , priority: "baja", list: lists[1]   , start: Date.new(2016,1,1) , finish: Date.new(2016,12,1) },
	{description: "tarea temporal, p media" ,state: "hecha" , priority: "media", list: lists[1]   , start: Date.new(2016,10,1) , finish: Date.new(2016,11,1)},
	{description: "tarea temporal, p alta" ,state: "expirada" , priority: "alta" , list: lists[1]   , start: Date.new(2016,12,1) , finish: Date.new(2016,12,2) }
	])


long_tasks= LongTask.create([
	{description: "tarea larga, p alta" ,state: "en_curso" , priority: "alta" , list: lists[0]  , progress: 10},
	{description: "tarea larga, p media" ,state: "en_curso" , priority: "media" , list: lists[0] , progress: 20},
	{description: "tarea larga, p baja" ,state:"pendiente" , priority: "baja" , list: lists[0]  , progress: 0},
	{description: "tarea larga, p baja" ,state:"hecha" , priority: "baja" , list: lists[1]  , progress: 100},
	{description: "tarea larga, p media" ,state: "en_curso" , priority: "media" , list: lists[1]   , progress: 9},
	{description: "tarea larga, p alta" ,state: "en_curso" , priority: "alta" , list: lists[1]  , progress: 5}
	])
