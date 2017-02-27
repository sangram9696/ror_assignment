require_relative 'file_operations'
require_relative 'config'
module Adapter
  class IO
    def initialize
      @file_io=FileOperations.new(SHOP_KEEPER_FILE_NAME)
    end

    def add(to_hash)
      @file_io.add(to_hash)
    end

    def edit(to_hash)
       @file_io.edit(to_hash)
    end

    def delete(pid)
      @file_io.delete(pid)
    end

    def search(word)
      @file_io.search(word)
    end

    def list_product
      @file_io.list
    end
  end
end