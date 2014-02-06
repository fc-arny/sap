@Backend.module 'OrderApp', (OrderApp, App, Backbone, Marionette, $, _) ->

  class OrderApp.Router extends Marionette.AppRouter
    appRoutes:
      'orders/:id/edit'     : 'edit'
      'orders(/page/:page)' : 'list'

  API =
    list: ->
      new OrderApp.List.Controller

    edit: (id) ->
      new OrderApp.Edit.Controller
        id: id

  App.addInitializer ->
    new OrderApp.Router
      controller: API

