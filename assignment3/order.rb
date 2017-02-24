require_relative 'file_operations'
require_relative 'inventory'
class Order
	def buy(product_id,user_name,card_number,cvv)
		inv=Inventory.new(SHOP_KEEPER_FILE_NAME)
		inv.manage_inventory_data(product_id)	#update inventory if user buy product		
		hash_data={"product_id"=>product_id,"user_name"=>user_name,
			"card_number"=>card_number,"cvv"=>cvv
		}
		#add user order details below
		file_io=FileOperations.new(SHOP_ORDER_FILE_NAME)
		file_io.add(hash_data)
	end
end

