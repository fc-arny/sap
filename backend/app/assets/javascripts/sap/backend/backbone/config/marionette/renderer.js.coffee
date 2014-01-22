Backbone.Marionette.Renderer.render = (template, data) ->
  path = JST['sap/backend/backbone/apps/' + template]

  unless path
    throw "Template sap/backend/backbone/apps/#{template} not found!"

  path(data)