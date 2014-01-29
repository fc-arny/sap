@Backend.module 'OrderApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base
    initialize: ->
      console.log 'Order.List.Controller'
      orders = App.request 'order:entities'
