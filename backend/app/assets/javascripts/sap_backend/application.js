// Global -------------------------
//---------------------------------
//= require js-routes
//= require i18n
//= require i18n/translations

// jQuery -------------------------
//---------------------------------
//= require lib/jquery
//= require jquery_ujs
//= require lib/jquery/jquery.spin

// Backbone -----------------------
//---------------------------------
//= require hamlcoffee
//= require lib/underscore
//= require lib/backbone
//= require lib/backbone/backbone.marionette

// Backbone Application -----------
//---------------------------------
//= require_tree ./backbone/config
//= require ./backbone/app
//= require_tree ./backbone/controllers
//= require_tree ./backbone/entities
//= require_tree ./backbone/views
//= require_tree ./backbone/components
//= require_tree ./backbone/apps

$(function(){
	$(document).on("click", "a[href^='/admin'], a:not(.external)", function(evt) {
		evt.preventDefault();
		Backbone.history.navigate($(this).attr("href").replace('/admin',''), true);
	});
});
