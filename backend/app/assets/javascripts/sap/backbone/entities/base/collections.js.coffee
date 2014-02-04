@Backend.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Collection extends Backbone.PageableCollection

    parse: (response)->
      if response.status is 'success'
        response.data.result
      else
        throw new Error(response.message)