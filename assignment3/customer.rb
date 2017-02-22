class Customer
	def show_customer_options
		puts "1.Add Product"
		puts "2.Remove Product"
		puts "3.List Product"
		puts "4.Edit Product "
		puts "5.Search Product"
		puts "Select oprion:- "
		self.get_customer_options
	end
	def get_customer_options
		option=gets.chomp.to_i
		case option
		when 1   
		  puts "it was 1" 
		when 2    
			puts "it was 2" 
		when 3   
		  puts "it was 3" 
		when 4    
			puts "it was 4" 
		when 5    
			puts "it was 5" 						
		else
		  puts "it was something else"
		end		
	end

end