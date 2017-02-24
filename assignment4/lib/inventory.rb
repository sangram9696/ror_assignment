class Inventory
  def initialize(file_name)
    @file_name = file_name
  end 
  
  def manage_inventory_data(product_id)
    count=1;
    File.open("inventory_temp.txt", "wb") do |input|
    end 
    File.open(@file_name, "r"){|file| 
      file.each_line do |line|
        result = line.split("|").map(&:strip)
        if result[0]==product_id
          if result[3]=="0"
            puts "Product not avliable"
          else
            File.open("inventory_temp.txt", "a+"){|filetemp| 
              line_no=(count).to_s
              stock=((result[3].to_i)-1).to_s
              data=result[0]+"|"+result[1]+"|"+result[2]+"|"+stock+"|"+result[4]  
              filetemp.puts(data)
            } 
           end   
          else
        File.open("inventory_temp.txt", "a+"){|filetemp| 
          line_no=(count).to_s  
          filetemp.puts line
        }   
          end 
        count=count+1 
      end
    }
    File.open("inventory_temp.txt", "rb") do |input|
      File.open(@file_name, "wb") do |output|
        while buff = input.read(4096)
        output.write(buff)
        end
      end
    end
  end
    
end

