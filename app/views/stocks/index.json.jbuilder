json.array! @stocks do |stock|
    json.partial! "./resource", resource: stock  
end 