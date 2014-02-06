@Backend.module 'OrderApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: 'order/list/list_layout'

    regions:
      tableRegion       : '#table-region'
      paginationRegion  : '#pagination-region'