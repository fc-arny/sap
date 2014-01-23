@Backend.module 'Backend.SidebarApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Sidebar extends App.Views.ItemView
    template: 'sidebar/list/sidebar'