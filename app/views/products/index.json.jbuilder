json.array! @products do |product|
    json.partial! "./resource", resource: product  
end  
