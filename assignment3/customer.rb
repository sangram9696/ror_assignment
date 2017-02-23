class Customer
	def show_customer_options
		puts "1.List Product"
		puts "2.Search Product"
		puts "3.Buy Product"		
		puts "Select oprion:- "
		self.get_customer_options
	end
	def get_customer_options
		option=gets.chomp.to_i
		case option
		when 1   
		  self.list_prodcut
		when 2    
		 self.search_prodcut
		when 3   
		 self.buy_prodcut			
		else
		  puts "it was something else"
		end		
	end

	def buy_prodcut
		self.list_product
		pro= Product.new
		puts "Enter product id to buy product:- "
		@product_id=STDIN.gets.chomp
		
		puts "Enter your name:- "
		@user_name=STDIN.gets.chomp		
		
		puts "Enter your card number:- "
		@card_number=STDIN.gets.chomp	

		puts "Enter your card cvv:- "
		@cvv=STDIN.gets.chomp	

		pro.buy(@product_id,@user_name,@card_number,@cvv)	
		self.list_product
	end	
	def search_prodcut
		puts "Search product:- "
		@word=STDIN.gets.chomp		
		pro= Product.new
		pro.search(@word)
	end	
	def list_product
		pro= Product.new
		pro.list
	end
end