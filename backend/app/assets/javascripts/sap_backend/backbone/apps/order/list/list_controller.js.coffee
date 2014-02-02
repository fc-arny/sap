@Backend.module 'OrderApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base
    initialize: ->
      orders = App.request 'order:entities'

      App.execute "when:fetched", orders, =>
        console.log orders
        @layout = @getLayoutView orders

        @listenTo @layout, 'show', =>
          @ordersRegion orders

        @show @layout

    ordersRegion: (orders) ->
      ordersView = @getOrdersView orders
      console.log '222'
      console.log orders
      @layout.tableRegion.show ordersView

    getOrdersView: (orders) ->
      new List.Orders
        collection: orders

    getLayoutView: (orders) ->
      new List.Layout
        collection: orders
