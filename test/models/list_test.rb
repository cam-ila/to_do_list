require 'test_helper'

class ListTest < ActiveSupport::TestCase

  test "Lista sin nombre" do
  	@list = List.new(name: "")
  	assert_not @list.save
  end

  test "Con nombre que respete la unicidad de los slugs" do
  	@list = List.new(name: "un super nombre")
  	assert @list.save
  end

  test "Con nombre que cause un conflicto de unicidad de los slugs" do

   @list_one = List.new(name: "pepe")
   assert @list_one.save

   @list_two = List.new(name: "pepe,")
   assert_not @list_two.save
  end

end
