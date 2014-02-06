@Backend.module 'OrderApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base
    initialize: ->
      orders = App.request 'order:entities'

      App.execute "when:fetched", orders, =>
        @layout = @getLayoutView()

        @listenTo @layout, 'show', =>
          @tableRegion orders

        @show @layout

    tableRegion: (orders) ->
      table = new App.Views.Grid
        collection: orders
        columns:    @getColumns()

      @layout.tableRegion.show(table)
      @layout.paginationRegion.show(new Backgrid.Extension.Paginator(collection: orders))


    getColumns: ->
      [
        {name: 'id', label: 'ID', cell: 'integer' },
        {name: 'state', label: 'State', cell: 'string'},
        {name: 'address', label: 'Address', cell: 'string'},
        {name: 'sum', label: 'SUM', cell: 'number'}
      ]

    getLayoutView: ->
      new List.Layout
