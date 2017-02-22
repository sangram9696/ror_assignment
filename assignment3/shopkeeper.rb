require_relative 'product'
class Shopkeeper
	def show_shopkeeper_options
		puts "1.Add Product"
		puts "2.Remove Product"
		puts "3.List Product"
		puts "4.Edit Product "
		puts "5.Search Product"
		puts "Select oprion:- "
		self.get_shopkeeper_options
	end
	def get_shopkeeper_options
		option=STDIN.gets.chomp.to_i
		case option
		when 1   
		  self.add_product
		when 2    
			self.delete_product
		when 3   
		  	self.list_product
		when 4    
			self.edit_product
		when 5    
			puts "it was 5" 						
		else
		  puts "it was something else"
		end		
	end

	def add_product
		puts "Enter product name:- "
		@product_name=gets.chomp
		puts "Enter product price:- "
		@price=gets.chomp
		puts "Enter stock item:- "
		@stock_item=gets.chomp
		puts "Enter company name:- "
		@company_name=gets.chomp
		pro= Product.new
		pro.add(@product_name,@price,@stock_item,@company_name)
		self.list_product
	end	

	def delete_product
		self.list_product
		puts "Enter product id to delete:- "
		@product_id=STDIN.gets.chomp
		pro= Product.new
		pro.delete(@product_id)
		self.list_product
	end	

	def edit_product
		self.list_product
		puts "Enter product id to update:- "
		@product_id=STDIN.gets.chomp
		puts "Enter product_name to update:- "
		@product_name=STDIN.gets.chomp
		puts "Enter price to update:- "
		@price=STDIN.gets.chomp
		puts "Enter stock_itemto update:- "
		@stock_item=STDIN.gets.chomp
		puts "Enter company_name to update:- "
		@company_name=STDIN.gets.chomp		
		pro= Product.new	
		pro.edit(@product_id,@product_name,@price,@stock_item,@company_name)
		self.list_product
	end

	def list_product
		pro= Product.new
		pro.list
	end
end