@Backend = do (Backbone, Marionette) ->
  App = new Marionette.Application

  App.addRegions
    pageContent: '.wrapper'
    breadcrumbs: '.breadLine'
    pageHeader:  '.contentTop'

  App.rootRoute = '/admin'

  App.addInitializer ->
    App.module('Backend.IndexApp').start()

  App.on 'initialize:after', (options) ->
    Backbone.history.start(
      pushState: true
      root: '/admin'
    )
    @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ''

  App