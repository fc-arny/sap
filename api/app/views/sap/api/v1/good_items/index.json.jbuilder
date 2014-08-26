# Additional information
json.count  @meta[:count]
json.limit  @meta[:limit]
json.offset @meta[:offset]

json.result @goods do |good_item|
  json.partial! 'sap/api/common/good_item', good_item: good_item
  json.value @ordered[good_item.id].value unless @ordered[good_item.id].blank?
end