json.orders @orders do |order|
  json.array!( json.orders order.decorate.index_set )
end