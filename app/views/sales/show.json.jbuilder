#json.partial! "./resource", resource: @sale
json.type @sale.class.name.underscore.pluralize
json.id @sale.id 
json.attributes {
    json.id @sale.id
    json.payment @sale.payment
    json.user_id @sale.user_id
    json.created_at @sale.created_at
    json.updated_at @sale.updated_at
    json.products @products
}

    