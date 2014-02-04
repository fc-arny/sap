@Backend.module 'OrderApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base
    initialize: ->
      orders = App.request 'order:entities'
#      pageTitle I18n.t('orders')
      App.execute "when:fetched", orders, =>
        @layout = @getLayoutView orders

        @listenTo @layout, 'show', =>
          @ordersRegion orders

        @show @layout

    ordersRegion: (orders) ->
      ordersView = @getOrdersView orders
      @layout.tableRegion.show(new Backgrid.Grid(columns: @getColumns(), collection: orders))

    getColumns: ->
      [
        {name: 'id', label: 'ID', cell: 'integer' },
        {name: 'state', label: 'State', cell: 'string'},
        {name: 'address', label: 'Address', cell: 'string'},
        {name: 'sum', label: 'SUM', cell: 'number'}
      ]

    getOrdersView: (orders) ->
      new List.Orders
        collection: orders

    getLayoutView: (orders) ->
      new List.Layout
        collection: orders
