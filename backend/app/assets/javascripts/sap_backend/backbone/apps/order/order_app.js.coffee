@Backend.module 'OrderApp', (OrderApp, App, Backbone, Marionette, $, _) ->

  class OrderApp.Router extends Marionette.AppRouter
    appRoutes:
      'orders/:id/edit' : 'edit'
      'orders'          : 'list'

  API =
    list: ->
      console.log 'OrderApp.Route.List'
      new OrderApp.List.Controller

    edit: (id) ->
      new OrderApp.Edit.Controller
        id: id

  App.addInitializer ->
    console.log 'OrderApp.Init'
    new OrderApp.Router
      controller: API

