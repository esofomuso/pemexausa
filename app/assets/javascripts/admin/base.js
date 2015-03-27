var ready = function () {
	$('#admin_countries').dataTable( {
	  "columnDefs": [
	    { "orderable": false, "targets": [3] },
	    { "searchable": false, "targets": [3] }
	  ]
	});
}

$(document).on('page:load ready', ready);