@Backend.module 'OrderApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: 'order/list/list_layout'

    regions:
      tableRegion       : '#table-region'
      paginationRegion  : '#pagination-region'

  class List.OrderItem extends App.Views.ItemView
    template: 'order/list/_order_item'
    tagName: 'tr'

  class List.Orders extends App.Views.CompositeView
    template: 'order/list/_orders'
    itemView: List.OrderItem
    itemViewContainer: 'tbody'