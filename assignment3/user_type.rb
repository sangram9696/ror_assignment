class UserType
  	require_relative 'shopkeeper'
  	require_relative 'customer'
  	def get_user_type
        USER_TYPE_OPTION.each do |key, value|
          puts value
        end
    		@user_type=STDIN.gets.to_i
    		case @user_type
    		when 1
    		  cust=Customer.new
    		  cust.show_customer_options
    		when 2
    			shop=Shopkeeper.new
    			shop.show_shopkeeper_options
    		else
    		  puts "it was something else"
    		end
  	end

end
inst=UserType.new
inst.get_user_type