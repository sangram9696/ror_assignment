require_relative 'fileoperation'
class Product
	def add(hash_data)
		file_io=FileOperation.new(SHOP_KEEPER_FILE_NAME)
		file_io.add(hash_data)
	end	

	def edit(hash_data)
		file_io=FileOperation.new(SHOP_KEEPER_FILE_NAME)
		file_io.edit(hash_data)
	end	

	def delete(product_id)
		file_io=FileOperation.new(SHOP_KEEPER_FILE_NAME)
		file_io.delete(product_id)
	end	

	def list
		file_io=FileOperation.new(SHOP_KEEPER_FILE_NAME)
		file_io.list
	end	

	def search(word)
		file_io=FileOperation.new(SHOP_KEEPER_FILE_NAME)
		file_io.search(word)
	end	
end

