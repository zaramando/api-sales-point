json.array! @sales do |sale|
    json.partial! "./resource", resource: sale  
end 