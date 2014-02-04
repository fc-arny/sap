@Backend.module 'DashboardApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: ->
      @layout = @getLayoutView()

      @listenTo @layout, "show", =>
#        @charts()

      @show @layout

    charts: ->
      console.log 'show charts'

    getLayoutView: ->
      new Show.Layout
