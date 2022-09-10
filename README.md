# Order Fulfilment Code Challenges

The coding challenge was to create a script that would that the data in the data.json file in the data folder and process it where it would change the order status to either "Fulfilled" or "Unfulfilled" based on the product availablity as well as output an array of unfulfilled order.

For more details read the Coding Challenge.docx

# Method of coding

I have created two model classes for the product and product_item where there are many product items in a product class.

The product_item would contain the following accessors:
- product_id
- description
- quantity_on_hand
- reorder_threshold
- reorder_amount
- delivery_lead_time

so every time the product_item was initialize, it would also be stored in the product class.

The product class would also have a method where it would find the product item by the product id which would be used in the order process method.

I would then create the command class where it would contain all the method to store the products and process the orders.

In the command class, it would contain the methods:
- read_file_data
    - This method would read the data from the data.json or any other json files with the same format. It would also abort the program if the file is not json or contain the keys "products" and "orders"
- store_product_data
    - This method would store the product data from data.json file into the product and product_item class
- process_order
    - This method would process the orders in the data.json file before returning an array of the unfulfilled order ids.
- check_partial_orders_item
    - This method would check if the orders are partials, if so then it would return false otherwise it would return true.
- reorder_product
    - This method is an empty stub method.
- process_order_items
    - This method would process each order items in the order where it would reduce the quantity of the product and reorder if it fell below the reorder threshold.
- check_stock_level
    - This method would also check if there is enough quantity of the product and would return false if there is not enough, it would also reorder if the quantity was below the reorder threshold to begin with.
- output_orders
    - This method would output the order and the items to the command line.
- check_product_format
    - This method would check for the products if the keys contain "productId", "description", "quantityOnHand", "reorderThreshold", "reorderAmount" and "deliveryLeadTime". It would abort the program if not. 

The main file would call the command class to store the product date before processing the order, it would then output the array of unfulfilled ids to the command line.

# Commands to run the program
There is no setup needed, just run the following.

```
ruby main.rb data/data.json
```