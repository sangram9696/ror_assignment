class FileOperations
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
				f = File.open(SHOP_KEEPER_FILE_NAME, "r")
				f.each_line do |line|
					puts line
				end
				f.close
		end	

		def add(hash_data)
				file_write_data=""
				hash_data.map do |key, value|
					file_write_data=file_write_data+SEPERATOR+value
				end
				write_data_to_file(@file_name,generate_id+file_write_data)
		end	

		def edit(hash_data)
				del_tpm_file_data(TEMP_FILE) #del temp file data
				temp_file_data_add_for_edit(hash_data) #add temp file data
				copy_file_data(TEMP_FILE,@file_name) #copy source to destn		
		end	

		def delete(product_id)
				find_product_by_id(product_id) #first find id if not found throw error
				del_tpm_file_data(TEMP_FILE) #del temp file data
				File.open(@file_name, "r"){|file| 
					file.each_line do |line|
						result = line.split(SEPERATOR).map(&:strip)
						if result.first!=product_id.to_s
							write_data_to_file(TEMP_FILE,line)	
						end		
					end
				}
				copy_file_data(TEMP_FILE,@file_name)#copy source to destn
				puts "Record deleted successfully"			
		end	

		def find_product_by_id(product_id)
				File.readlines(SHOP_KEEPER_FILE_NAME).each do |line|
					 result = line.split(SEPERATOR).map(&:strip)
					 if(result.first==product_id)
					 	return true
					end
				end	
				abort("No record found")			
		end	

		def del_tpm_file_data(temp_file_name)
			File.open(temp_file_name, "wb") do |input|
			end	
		end

		def copy_file_data(source_file,dest_file)
			File.open(source_file, "rb") do |input|
				File.open(dest_file, "wb") do |output|
					while buff = input.read(FILE_BUFFER_SIZE)
					output.write(buff)
					end
				end
			end
		end	

		def write_data_to_file(file,data)
				File.open(file, "a+"){|file| 
					file.puts(data)
				}
		end			

		private

		def temp_file_data_add_for_edit(hash_data)
				product_id=hash_data['product_id']
				File.open(@file_name, "r"){|file| 
					file.each_line do |line|
						result = line.split(SEPERATOR).map(&:strip)
							if result.first==product_id.to_s
								file_write_data=""
								hash_data.each do |key, value|
									file_write_data=file_write_data+SEPERATOR+value
								end	
								file_write_data.slice!(0) #=> "| remove first chra"	
								write_data_to_file(TEMP_FILE,file_write_data)
							else
								write_data_to_file(TEMP_FILE,line)
							end	
					end
				}
		end

		def generate_id
				File.open(@file_name, "r"){|file| 
					if file.count>0
						lines = File.open(@file_name).to_a
						result = lines.last.split(SEPERATOR).map(&:strip)
						return (result[0].to_i+1).to_s
					else
						return '1'
					end	
				}			
		end	
end	