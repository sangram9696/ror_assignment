require_relative 'file_operations'
class Product
  def initialize args
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def add
    file_io=FileOperations.new(SHOP_KEEPER_FILE_NAME)
    file_io.add(to_hash)
  end

  def edit
    file_io=FileOperations.new(SHOP_KEEPER_FILE_NAME)
    file_io.edit(to_hash)
  end

  def delete
    file_io=FileOperations.new(SHOP_KEEPER_FILE_NAME)
    file_io.delete(to_hash[:product_id])
  end

  def search(word)
    file_io=FileOperations.new(SHOP_KEEPER_FILE_NAME)
    file_io.search(word)
  end

  def to_hash
    instance_variables.map do |var|
      [var[1..-1].to_sym, instance_variable_get(var)]
    end.to_h
  end

end

