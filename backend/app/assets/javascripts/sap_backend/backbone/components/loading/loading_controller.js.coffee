@Backend.module 'Components.Loading', (Loading, App, Backbone, Marionette, $, _) ->

  class Loading.LoadingController extends App.Controllers.Base
    initialize: (options)->
      { view } = options

      loadingView = @getLoadingView()
      @show loadingView

    getLoadingView: ->
      new Loading.LoadingView

  App.commands.setHandler 'show:loading', (view, options) ->
    new Loading.LoadingController
      view: view
      region: options.region