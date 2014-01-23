@Backend.module 'Backend.SidebarApp', (SidebarApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    list: ->
      new SidebarApp.List.Controller
        region: App.sideRegion

  SidebarApp.on 'start', ->
    API.list()