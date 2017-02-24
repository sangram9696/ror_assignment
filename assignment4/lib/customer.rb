require_relative 'order'
require_relative 'fileoperation'
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
		  self.list_product
		when 2    
		 self.search_product
		when 3   
		 self.buy_prodcut			
		else
		  puts "it was something else"
		end		
	end

	def list_product
		file_io=FileOperation.new(SHOP_KEEPER_FILE_NAME)
		file_io.list
	end		

	def buy_prodcut
		self.list_product
		puts "Enter product id to buy product:- "
		@product_id=STDIN.gets.chomp
		
		puts "Enter your name:- "
		@user_name=STDIN.gets.chomp		
		
		puts "Enter your card number:- "
		@card_number=STDIN.gets.chomp	

		puts "Enter your card cvv:- "
		@cvv=STDIN.gets.chomp	

		order= Order.new
		order.buy(@product_id,@user_name,@card_number,@cvv)	
		self.list_product
	end	

	def search_product(word)
		file_io=FileOperation.new(SHOP_KEEPER_FILE_NAME)
		file_io.search(word)
	end	
end