require_relative 'file_operations'
class Inventory
  def initialize(file_name)
    @file_name = file_name
  end

  def inventory_data(product_id)
    file_io=FileOperations.new(SHOP_KEEPER_FILE_NAME)
    file_io.write_inventory_data(product_id)
  end
end

