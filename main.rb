require_relative 'model/commands'

def main
    input_file = ARGV[0]

    product = Product.new

    command = Commands.new(product)

    command.store_product_data(input_file)

    unfulfilled_orders_array = command.process_order(input_file)

    puts "Unfulfilled orders ids: [#{unfulfilled_orders_array.join(", ") }]"
end

main