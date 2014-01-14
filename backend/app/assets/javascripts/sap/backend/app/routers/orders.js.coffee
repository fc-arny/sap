class Backend.Routers.Orders extends Support.SwappingRouter

  # -------------------------------------------------- Init router
  initialize: (data) ->
    @el = $('#content .wrapper')


  # -------------------------------------------------- Routers
  routes:
    'orders'          : 'list'
    'orders/:id'      : 'item'
    'orders/:id/edit' : 'edit'