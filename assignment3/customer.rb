require_relative 'order'
require_relative 'file_operations'
class Customer
  def show_customer_options
    CUSTOMER_OPTIONS.each do |key, value|
      puts value
    end
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
    product_data_hash={}
    GET_BUY_PRODUCTS_DATA.each do |key, value|
        puts value
        product_data_hash[key]=STDIN.gets.chomp
    end
    order= Order.new(product_data_hash)
    order.buy_product
    list_product
  end

  def search_product
    puts "Eneter Search "
    word=option=gets.chomp.to_s
    file_io=FileOperations.new(SHOP_KEEPER_FILE_NAME)
    file_io.search(word)
  end

end
