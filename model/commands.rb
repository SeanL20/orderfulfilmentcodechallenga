require_relative 'order'
require_relative 'product'
require "json"

class Commands
    def self.store_product_data(data, product)
        file = File.open data

        file_data = JSON.load file
        
        product_data = file_data["products"]

        product_data.each do |data|
            ProductItem.new(
                product_id: data["productId"],
                description: data["description"],
                quantity_on_hand: data["quantityOnHand"],
                reorder_threshold: data["reorderThreshold"],
                reorder_amount: data["reorderAmount"],
                delivery_lead_time: data["deliveryLeadTime"],
                product: product
            )
        end
    end

    def reorder_product

    end

    def process_order(data)
        order_data = data["orders"]
    end
end
