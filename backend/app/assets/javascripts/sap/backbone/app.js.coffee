@Backend = do (Backbone, Marionette) ->
  App = new Marionette.Application

  App.addRegions
    mainRegion    : '#main-region'
    sideRegion    : '#side-region'

  App.rootRoute = 'dashboard'

  App.reqres.setHandler 'default:region', ->
    App.mainRegion

  App.addInitializer ->
    App.module('SidebarApp').start()

  App.commands.setHandler 'register:instance', (instance, id) ->
    App.register instance, id

  App.commands.setHandler 'unregister:instance', (instance, id) ->
    App.unregister instance, id

  App.on 'initialize:after', (options) ->
    @startHistory()
    @navigate(@rootRoute, trigger: true) unless @getCurrentRoute()

  pageTitle: (title) ->
    $('.pageTitle').html title

  App