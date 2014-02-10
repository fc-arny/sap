@Backend.module 'Views', (Views, App, Backbone, Marionette, $, _) ->

  class Views.Grid extends Backgrid.Grid
    className: 'backgrid tDark'

  class Views.Grid.ActionsFormatter extends Backgrid.CellFormatter
    fromRaw: (rawValue, model) ->
      value = """
        <ul class="navi nav-pills">
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown">Actions<b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="#{rawValue}" class=""><span class="icos-pencil"></span>Edit</a></li>
              <li><a href="#{rawValue}"><span class="icos-add"></span>View</a></li>
              <li><a href="#{rawValue}"><span class="icos-trash"></span>Remove</a></li>
            </ul>
          </li>
        </ul>
      """
  class Views.Grid.ActionsCell extends Backgrid.Cell
    formatter: Views.Grid.ActionsFormatter

    render: ->
      @$el.empty()
      formattedValue = @formatter.fromRaw @model.get(@column.get("name")), @model
      @$el.html formattedValue
      @delegateEvents()
      @


  _.extend Backgrid.HeaderCell::,
    tagName: 'td'

  _.extend Backgrid.Column::,
    defaults: _.defaults(
      editable: false
    , Backgrid.Column::defaults)