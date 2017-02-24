require_relative 'order'
require_relative 'file_operations'
class Customer
	def show_customer_options
		puts "1.List Product"
		puts "2.Search Product"
		puts "3.Buy Product"		
		puts "Select oprion:- "
		get_customer_options
	end
	def get_customer_options
		option=gets.chomp.to_i
		case option
		when 1   
		 list_product
		when 2    
		 search_product
		when 3   
		 buy_prodcut			
		else
		  puts "it was something else"
		end		
	end

	def list_product
		file_io=FileOperations.new(SHOP_KEEPER_FILE_NAME)
		file_io.list
	end		

	def buy_prodcut
		list_product
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
		list_product
	end	

	def search_product
		puts "Eneter Search "
		word=option=gets.chomp.to_s
		file_io=FileOperations.new(SHOP_KEEPER_FILE_NAME)
		file_io.search(word)
	end	
end