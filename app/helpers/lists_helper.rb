module ListsHelper
 def priority(number)
 	{0=> "alta", 1=> "media", 2=> "baja"}[number]
 end

end
