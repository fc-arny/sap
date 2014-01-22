@Backend.module 'Backend.IndexApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: ->
      dashboardView = @getIndexView()
      App.pageContent.show dashboardView

    getIndexView: ->
      new Show.Dashboard
