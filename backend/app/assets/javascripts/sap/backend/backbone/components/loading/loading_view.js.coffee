@Backend.module 'Components.Loading', (Loading, App, Backbone, Marionette, $, _) ->

  class Loading.LoadingView extends App.Views.ItemView
    template: false
    className: 'loading-container'

    onShow: ->
      @$el.spin

    onClose: ->
      @$el.spin false
