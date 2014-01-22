@Backend.module 'Backend.IndexApp', (IndexApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    show: ->
      IndexApp.Show.Controller.show()

  IndexApp.on 'start', ->
    API.show()

