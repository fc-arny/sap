@Backend.module 'Backend.IndexApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Dashboard extends Marionette.ItemView
    template: 'index/show/templates/dashboard'
