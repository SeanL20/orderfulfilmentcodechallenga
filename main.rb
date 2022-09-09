require_relative 'model/commands'

def main
    input_file = ARGV[0]

    product = Product.new

    command = Commands.new(product)

    command.store_product_data(input_file)

    command.process_order(input_file)
end

main