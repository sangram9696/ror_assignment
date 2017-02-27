require_relative 'adapter'
class Product
  def initialize args
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def add
    Adapter::IO.new.add(to_hash)
  end

  def edit
    Adapter::IO.new.edit(to_hash)
  end

  def delete
    Adapter::IO.new.delete(product_id)
  end

  def search(word)
    Adapter::IO.new.search(to_hash[:product_id])
  end

  def to_hash
    instance_variables.map do |var|
      [var[1..-1].to_sym, instance_variable_get(var)]
    end.to_h
  end

end

