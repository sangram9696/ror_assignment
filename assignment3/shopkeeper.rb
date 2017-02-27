require_relative 'product'
require_relative 'config'
require_relative 'adapter'
class Shopkeeper
	def show_shopkeeper_options
		PRODUCT_OPERATION_OPTION.each do |key, value|
		  puts value
		end
		get_shopkeeper_options
	end

	def get_shopkeeper_options
		option=STDIN.gets.chomp.to_i
		case option
		when 1
		  add_product
		when 2
				delete_product
		when 3
		  	Adapter::IO.new.list_product
		when 4
				edit_product
		when 5
				search_prodcut
		else
		  puts "it was something else"
		end
	end

	def add_product
		product_data_hash={}
		GET_PRODUCTS_DATA.each do |key, value|
		    puts value
		    product_data_hash[key]=STDIN.gets.chomp
		end
		pro= Product.new(product_data_hash)
		pro.add
		Adapter::IO.new.list_product
	end

	def delete_product
		Adapter::IO.new.list_product
		puts "Enter product id to delete:- "
		product_data_hash={:product_id=>STDIN.gets.chomp}
		pro= Product.new(product_data_hash)
		pro.delete
		Adapter::IO.new.list_product
	end

	def edit_product
		Adapter::IO.new.list_product
		product_data_hash={}
		GET_PRODUCTS_DATA_UPDATE.each do |key, value|
		    puts value
		    product_data_hash[key]=STDIN.gets.chomp
		end
		pro= Product.new(product_data_hash)
		pro.edit
		Adapter::IO.new.list_product
	end

	def search_prodcut
		puts "Search product:- "
		@word=STDIN.gets.chomp
		pro= Product.new
		pro.search(@word)
	end

	def list_product
		Adapter::IO.new.list_product
	end

end