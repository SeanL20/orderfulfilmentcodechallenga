require_relative 'product_item'

class Product
    attr_accessor :product_items

    # Initialize a product class
	def initialize()
		@product_items = []
	end

    def find_product_item_by_id(id)
        @product_items.each do |product_item|
            return product_item if product_item.product_id == id
        end
    end
end