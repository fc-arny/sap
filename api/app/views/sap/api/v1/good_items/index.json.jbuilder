# Additional information
json.count  @meta[:count]
json.limit  @meta[:limit]
json.offset @meta[:offset]

json.result @goods do |good_item|
  json.partial! 'sap/api/common/good_item', good_item: good_item
  json.ordered @ordered[good_item.id], :order_id, :value, :price unless @ordered[good_item.id].blank?
end