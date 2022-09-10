require_relative 'product'
require "json"

class Commands
    def initialize(product)
        @product = product
    end

    def store_product_data(file_path)
        file_data = read_file_data(file_path)
        
        product_data = file_data["products"]

        product_data.each do |data|
            ProductItem.new(
                product_id: data["productId"],
                description: data["description"],
                quantity_on_hand: data["quantityOnHand"],
                reorder_threshold: data["reorderThreshold"],
                reorder_amount: data["reorderAmount"],
                delivery_lead_time: data["deliveryLeadTime"],
                product: @product
            )
        end
    end

    def process_order(file_path)
        file_data = read_file_data(file_path)

        order_data = file_data["orders"]

        unfulfilled_orders = []

        order_data.each do |order_items|
            status_check = check_partial_orders_item(order_items["items"])
            status_check = process_order_items(order_items["items"])
            
            if status_check
                order_items["status"] = "Fulfilled"
            else
                order_items["status"] = "Unfulfilled"
                unfulfilled_orders << order_items["orderId"]
            end
        end
        
        output_orders(order_data)

        return unfulfilled_orders
    end

    # reads the json file data and load it.
    def read_file_data(file_path)
        abort "Incorrect File Type" if File.extname(file_path) != ".json"

        file = File.open file_path

        file_data = JSON.load file

        return file_data
    end

    # Stub reorder method
    def reorder_product

    end

    # checks if the orders are partials
    def check_partial_orders_item(order_items)
        order_keys = ["orderId", "productId", "quantity", "costPerItem"]
        order_items.each do |order_item|
            return false unless order_item.keys == order_keys
            return false unless order_item["quantity"] != 0
        end
    end

    #process the order items arrays from the json data.
    def process_order_items(order_items)
        order_items.each do |order_item|
            product_item = @product.find_product_item_by_id(order_item["productId"])

            return false if check_stock_level(order_item, product_item)

            product_item.quantity_on_hand -= order_item["quantity"].to_i

            reorder_product if product_item.quantity_on_hand < product_item.reorder_threshold
        end

        return true
    end

    # check stock level and reorder product if the product is below the threshold
    def check_stock_level(order_item, product_item)
        reorder_product if product_item.quantity_on_hand < product_item.reorder_threshold

        return order_item["quantity"].to_i > product_item.quantity_on_hand
    end

    def output_orders(order_data)
        order_data.each do |order_items|
            puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
            puts "Order Id: #{order_items["OrderId"]}"
            puts "status: #{order_items["status"]}"
            puts "Date Createdd: #{order_items["dateCreated"]}"
            order_items["items"].each do |item|
                puts "========================================================================================================"
                puts "Product Id: #{item["productId"]}"
                puts "Quantity: #{item["quantity"]}"
                puts "Cost Per Item: #{item["costPerItem"]}"
                puts "========================================================================================================"
            end
            puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
        end
    end
end
