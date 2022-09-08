require_relative 'product_item'

class Product
    attr_accessor :product_items

    # Initialize a product class
	def initialize()
		@product_items = []
	end
end