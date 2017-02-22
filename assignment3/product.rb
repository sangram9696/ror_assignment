class Product
	def add(product_name,price,stock_item,company_name)
		data=product_name+"|"+price+"|"+stock_item+"|"+company_name
		File.open("inventory.txt", "a+"){|file| 
			line_no=(file.count+1).to_s	
			file.puts line_no+"|"+data
		}
	end	

	def edit(product_id,product_name,price,stock_item,company_name)
		data=product_name+"|"+price+"|"+stock_item+"|"+company_name
		puts "In edit function and product id is "+product_id
		count=1;
		
		File.open("inventory_temp.txt", "wb") do |input|
		end	

		File.open("inventory.txt", "r"){|file| 
			file.each_line do |line|
					if line[0]==product_id.to_s
				File.open("inventory_temp.txt", "a+"){|filetemp| 
					line_no=(count).to_s	
					filetemp.puts line_no+"|"+data
				}	
					else
				File.open("inventory_temp.txt", "a+"){|filetemp| 
					line_no=(count).to_s	
					filetemp.puts line_no+"|"+line
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
	end	

	def list
		f = File.open("inventory.txt", "r")
		f.each_line do |line|
			puts line
		end
		f.close
	end	

end

