@Backend = do (Backbone, Marionette) ->
  App = new Marionette.Application

  App.addRegions
    mainRegion: '#main-region'
    breadcrumbs: '.breadLine'
    pageHeader:  '.contentTop'

  App.rootRoute = 'dashboard'

  App.reqres.setHandler 'default:region', ->
    App.mainRegion

#  App.addInitializer ->
#    App.module('Backend.IndexApp').start()

  App.commands.setHandler 'register:instance', (instance, id) ->
    App.register instance, id

  App.commands.setHandler 'unregister:instance', (instance, id) ->
    App.unregister instance, id

  App.on 'initialize:after', (options) ->
    Backbone.history.start(
      root: '/admin'
    )

    @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ''

  App