#json.partial! "./resource", resource: @sale
json.type @sale.class.name.underscore.pluralize
json.id @sale.id 
json.attributes {
    json.id @sale.id
    json.payment @sale.payment
    json.user_id @sale.user_id
    json.products {
        json.array! @products do |product|
            json.id product.id
            json.product_id product.product_id
            json.quantity product.quantity
            json.sale_id product.sale_id
            json.name product.name
            json.code product.code
            json.price product.price
            json.description product.description
            json.created_at product.created_at
            json.updated_at product.updated_at
        end  
    }       
    #json.products @products
    json.created_at @sale.created_at
    json.updated_at @sale.updated_at
}

    