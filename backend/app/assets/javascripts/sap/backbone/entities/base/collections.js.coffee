@Backend.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Collection extends Backbone.PageableCollection

    parse: (response, options) ->
      if response.status is 'success'
        super(response, options)
      else
        throw new Error(response.message)

    parseState: (resp, queryParams, state, options) ->
      totalRecords: resp.data.total_count

    parseRecords: (resp, options) ->
      resp.data.result

