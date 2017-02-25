require_relative 'file_operations'
require_relative 'inventory'
class Order
	def initialize args
		args.each do |k,v|
		  instance_variable_set("@#{k}", v) unless v.nil?
		end
	end

	def buy_product
		hash_data=to_hash
		inv=Inventory.new(SHOP_KEEPER_FILE_NAME)
		inv.inventory_data(hash_data[:product_id])	#update inventory if user buy product
		file_io=FileOperations.new(SHOP_ORDER_FILE_NAME)
		file_io.add(to_hash) ## add order
	end

	def to_hash
		instance_variables.map do |var|
		  [var[1..-1].to_sym, instance_variable_get(var)]
		end.to_h
	end
end
