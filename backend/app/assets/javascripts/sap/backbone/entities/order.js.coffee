@Backend.module 'Entities', (Entities, App, Backbone, Marionette, $, _ ) ->

  class Entities.Order extends App.Entities.Model
    urlRoot: -> Routes.sap_api_v1_orders_path()

  class Entities.OrderCollection extends App.Entities.Collection
    model: Entities.Order
    url: -> Routes.sap_api_v1_orders_path()
    state:
      pageSize: 15

    mode: 'server'

  API =
    getOrders: ->
      orders = new Entities.OrderCollection
      orders.fetch
        reset: true

      orders

  App.reqres.setHandler "order:entities", ->
    API.getOrders()