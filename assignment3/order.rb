require_relative 'fileoperation'
class Order
	def buy(product_id,user_name,card_number,cvv)
		count=1;
		File.open("inventory_temp.txt", "wb") do |input|
		end	
		File.open(SHOP_ORDER_FILE_NAME, "r"){|file| 
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

			file_io=FileOperation.new(SHOP_ORDER_FILE_NAME)
			#copy source to destn
			file_io.copy_file_data("inventory_temp.txt",@file_name)
	
			 hash_data={"product_id"=>product_id,"user_name"=>user_name,"card_number"=>card_number,
				"cvv"=>cvv
			 }
			self.add_user_order_info(hash_data)
	end

	def add_user_order_info(hash_data)
		file_io=FileOperation.new(SHOP_ORDER_FILE_NAME)
		file_io.add(hash_data)
	end		

end

