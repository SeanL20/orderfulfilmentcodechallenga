class OrderItem
    attr_accessor :order_id, 
        :product_id, 
        :quantity,
        :cost_per_item
    attr_reader :order

    
    # Initialize a order item class.
	def initialize(order_id:, product_id:, quantity:, cost_per_item:)
		@order_id = order_id
		@product_id = product_id.to_i
		@quantity = quantity.to_i
		@cost_per_item = cost_per_item
	end
end