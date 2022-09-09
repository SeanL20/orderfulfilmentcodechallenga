class ProductItem
    attr_accessor :product_id, 
        :description,
        :quantity_on_hand, 
        :reorder_threshold, 
        :reorder_amount, 
        :delivery_lead_time,
        :product

    # Initialize a product class
	def initialize(product_id:, description:, quantity_on_hand:, reorder_threshold:, delivery_lead_time:, product:)
		@product_id = product_id
		@description = description.to_i
		@quantity_on_hand = quantity_on_hand.to_i
		@reorder_threshold = reorder_threshold.to_i
		@delivery_lead_time = delivery_lead_time.to_i
        @product = product

        @product.product_items << self
	end
end