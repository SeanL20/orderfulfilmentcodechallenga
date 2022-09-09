require_relative 'order'
require_relative 'product'

class Commands
    def store_product_data(data)
        product_data = data["product"]

        product = Product.new

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
