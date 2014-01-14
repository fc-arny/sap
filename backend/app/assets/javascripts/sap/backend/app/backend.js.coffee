window.Backend =
  Views: {}
  Models: {}
  Routers: {}
  Collections: {}

  initialize: (data)->

    if !Backbone.history.started
      Backbone.history.start(
        pushState: true
        root: '/admin/'
      )