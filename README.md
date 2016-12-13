# ToDoList

## Pasos para ejecutar la aplicacion:
```sh
$ git clone https://github.com/cam-ila/to_do_list.git
$ cd to_do_list
$ bundle install
$ bundle exec rails db:migrate
$ bundle exec rails db:seed
$ bundle exec rails server
```

## Funcionamiento

* Pantalla inicial
	* Se puede crear una lista ingresando su nombre. Lleva a la Vista de lista.
	* Se muestra, en caso de tener esta información, una lista con las últimas 5 listas creadas
desde el mismo navegador desde el que está ingresando el usuario, cada una con un vínculo para acceder a la lista de tareas.

* Vista de listas
	* Se muestra el nombre de la lista.
	* La fecha de creación de la lista.
	* La fecha de última modificación de la lista.
	* Un link a la lista.
	* Las tareas de la lista, con la mayor cantidad de información posible acorde al tipo de cada tarea ordenadas por prioridad descendentemente.

* Se permite:
	* Modificar el nombre de la lista.
	* Agregar ítems a la lista.
	* Modificar cualquiera de los ítems existentes.
	* Volver a la Pantalla inicial.
