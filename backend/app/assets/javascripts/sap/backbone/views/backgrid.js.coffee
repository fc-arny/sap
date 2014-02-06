@Backend.module 'Views', (Views, App, Backbone, Marionette, $, _) ->

  class Views.Grid extends Backgrid.Grid
    className: 'backgrid tDark'

  _.extend Backgrid.HeaderCell::,
    tagName: 'td'

  _.extend Backgrid.Column::,
    defaults: _.defaults(
      editable: false
    , Backgrid.Column::defaults)