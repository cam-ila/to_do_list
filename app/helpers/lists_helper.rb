module ListsHelper
 def priority(number)
 	{0=> "alta", 1=> "media", 3=> "baja"}[number]
 end
end
