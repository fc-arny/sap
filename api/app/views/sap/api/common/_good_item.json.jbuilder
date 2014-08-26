json.(good_item, :id, :price, :store_id)

# Good fields
json.good do
  json.(good_item.good, :id, :name, :description, :value)
end

json.measure do
  json.(good_item.measure, :id, :name)
end

json.images good_item.try(:images) do |i|
  json.url i.thumb('430x430').url
end