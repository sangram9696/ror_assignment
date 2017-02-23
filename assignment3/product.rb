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

	def add_user_order_info(product_id,user_name,card_number,cvv)
		data=product_id.to_s+"|"+user_name+"|"+card_number.to_s+"|"+cvv.to_s
		File.open("orders.txt", "a+"){|file| 
			line_no=(file.count+1).to_s	
			file.puts line_no+"|"+data
		}
	end	

	def buy(product_id,user_name,card_number,cvv)
		count=1;
		File.open("inventory_temp.txt", "wb") do |input|
		end	
		File.open("inventory.txt", "r"){|file| 
			file.each_line do |line|
				result = line.split("|").map(&:strip)
				if result[0]==product_id
					if result[3]=="0"
						puts "Product not avliable"
					else
						File.open("inventory_temp.txt", "a+"){|filetemp| 
							line_no=(count).to_s
							stock=((result[3].to_i)-1).to_s
							data=result[0]+"|"+result[1]+"|"+result[2]+"|"+stock+"|"+result[4]	
							filetemp.puts(data)
						}	
					 end   
					else
				File.open("inventory_temp.txt", "a+"){|filetemp| 
					line_no=(count).to_s	
					filetemp.puts line
				}		
					end	
				count=count+1	
			end
		}
			File.open("inventory_temp.txt", "rb") do |input|
				File.open("inventory.txt", "wb") do |output|
					while buff = input.read(4096)
					output.write(buff)
					end
				end
			end	

			self.add_user_order_info(product_id,user_name,card_number,cvv)
	end	

end

