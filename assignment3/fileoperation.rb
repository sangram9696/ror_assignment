class FileOperation
	def initialize(file_name)
		@file_name = file_name
	end 
	def search(word)
		File.open(@file_name) do |f|
		  f.any? do |line|
		     if line.include?(word)
		     	puts line
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

	def add(hash_data)
		file_write_data=""
		hash_data.each do |key, value|
			file_write_data=file_write_data+"|"+value
		end
		File.open(@file_name, "a+"){|file| 
			id=1
			if file.count>0
				id=generate_id
			end	
			file.puts id.to_s+file_write_data
		}
	end	

	def edit(hash_data)
		#del temp file data
		File.open("inventory_temp.txt", "wb") do |input|
		end	
		self.del_tpm_file_data("inventory_temp.txt")
		count=1;
		product_id=hash_data['product_id']
		File.open(@file_name, "r"){|file| 
			file.each_line do |line|
				result = line.split("|").map(&:strip)
					if result[0]==product_id.to_s
				File.open("inventory_temp.txt", "a+"){|filetemp| 
					line_no=(count).to_s
					file_write_data=""
					hash_data.each do |key, value|
						file_write_data=file_write_data+"|"+value
					end	
					file_write_data.slice!(0) #=> "| remove first chra"	
					filetemp.puts(file_write_data)
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
		#copy source to destn
		self.copy_file_data("inventory_temp.txt",@file_name)
				
	end

	def delete(product_id)
		self.find_product_by_id(product_id) #first find id if not found throw error
		count=1;
		File.open("inventory_temp.txt", "wb") do |input|
		end	
		File.open(@file_name, "r"){|file| 
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
		#copy source to destn
		self.copy_file_data("inventory_temp.txt",@file_name)
		puts "Record deleted successfully"			
	end	

	def find_product_by_id(product_id)
	   result = false
	   File.readlines(SHOP_KEEPER_FILE_NAME).each do |line|
	     result = line.split("|").map(&:strip)
	     if(result[0] == product_id)
	       result = true
	       puts
	       break
	     else
	       result = false
	     end
	   end
	   	if result
	   		return true	
	   	else
	   		puts "No Record Found. In new method"
	   	end			
	end	

	def del_tpm_file_data(temp_file_name)
		File.open(temp_file_name, "wb") do |input|
		end	
	end

	def copy_file_data(source_file,dest_file)
		File.open(source_file, "rb") do |input|
			File.open(dest_file, "wb") do |output|
				while buff = input.read(4096)
				output.write(buff)
				end
			end
		end
	end	

	private def generate_id
		lines = File.open(@file_name).to_a
		result = lines.last.split("|").map(&:strip)
		return (result[0].to_i+1).to_s
	end	
end	