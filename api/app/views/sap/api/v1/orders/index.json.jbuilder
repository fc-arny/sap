json.result @orders do |order|
  json.array!( json.result order.decorate.index_set )
end

json.total_count @orders.total_count