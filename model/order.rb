require_relative 'order_item'

class Order
    attr_accessor :order_id, 
        :status, 
        :date_created,
        :order_items
    
    # Initialize a order class
	def initialize(order_id:, status:, date_created:)
		@order_id = order_id
		@status = status
		@date_created = date_created

		@order_items = []
	end
end