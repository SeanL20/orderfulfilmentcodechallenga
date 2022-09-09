require_relative 'model/commands'

def main
    input_file = ARGV[0]

    product = Product.new

    Commands.store_product_data(input_file, product)
    puts product.inspect
end

main