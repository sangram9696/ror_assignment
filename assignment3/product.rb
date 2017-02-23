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
				result = line.split("|").map(&:strip)
					if result[0]==product_id.to_s
				File.open("inventory_temp.txt", "a+"){|filetemp| 
					line_no=(count).to_s	
					filetemp.puts line_no+"|"+data
				}	
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
	end	

	def delete(product_id)
		count=1;
		File.open("inventory_temp.txt", "wb") do |input|
		end	

		File.open("inventory.txt", "r"){|file| 
			file.each_line do |line|
					result = line.split("|").map(&:strip)
					if result[0]!=product_id.to_s
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
	end	
	def list
		f = File.open("inventory.txt", "r")
		f.each_line do |line|
			puts line
		end
		f.close
	end	

	def search(word)
		File.open("inventory.txt") do |f|
		  f.any? do |line|
		     if line.include?(word)
		     	puts line
		     end	
		  end
		end					
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

