// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require dataTables/jquery.dataTables
//= require owl.carousel
//= require turbolinks
//= require_tree .
//= require bootstrap-modal
//= require bootstrap-modalmanager

var ready = function () {
	//alert("document is ready");
	//$(window).load();
	//$("#owl-carousel").show();
	$("#owl-carousel").owlCarousel({
		autoPlay : 3000,
		 stopOnHover : true,
		 paginationSpeed : 1000,
		 goToFirstSpeed : 2000,
		 singleItem : true,
		 autoHeight : true,
		 transitionStyle:"fade"
	});
	$('.owl-pagination').hide();
	
	$('#loginModal').modal('options')
	  var body = $( 'show' );
}

$(document).on('page:load ready', ready);
//$(document).ready()