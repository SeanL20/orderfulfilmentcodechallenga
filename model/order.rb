class Order
    attr_accessor :order_id, 
        :status, 
        :date_created,
        :items
    
    # Initialize a order class
	def initialize(order_id:, status:, date_created:)
		@order_id = order_id
		@status = status
		@date_created = date_created

		@items = []
	end
end