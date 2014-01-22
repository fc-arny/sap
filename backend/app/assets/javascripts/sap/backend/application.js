// jQuery -------------------------
//---------------------------------
//= require lib/jquery
//= require jquery_ujs
//= //require jquery.remotipart

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
//= require_tree ./backbone/apps

$(function(){
	$(document).on("click", "a[href^='/admin'], a:not(.external)", function(evt) {
		evt.preventDefault();
		Backbone.history.navigate($(this).attr("href").replace('/admin',''), true);
	});
});
