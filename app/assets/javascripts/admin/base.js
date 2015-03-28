var ready = function () {
	$('#admin_countries').dataTable( {
	  "columnDefs": [
	    { "orderable": false, "targets": [3] },
	    { "searchable": false, "targets": [3] }
	  ]
	});
	
	
	$('#admin_users_list').dataTable( {
	  "columnDefs": [
	    { "orderable": false, "targets": [6] },
	    { "searchable": false, "targets": [6] }
	  ]
	});
	
	$('#admin_members').dataTable( {
	  "columnDefs": [
	    { "orderable": false, "targets": [3] },
	    { "searchable": false, "targets": [3] }
	  ]
	});
	
	$('#admin_chapters').dataTable( {
	  "columnDefs": [
	    { "orderable": false, "targets": [3] },
	    { "searchable": false, "targets": [3] }
	  ]
	});
	
	$('#admin_projects').dataTable( {
	  "columnDefs": [
	    { "orderable": false, "targets": [3] },
	    { "searchable": false, "targets": [3] }
	  ]
	});
	$('#admin_events').dataTable( {
	  "columnDefs": [
	    { "orderable": false, "targets": [3] },
	    { "searchable": false, "targets": [3] }
	  ]
	});
	$('#admin_donations').dataTable( {
	  "columnDefs": [
	    { "orderable": false, "targets": [3] },
	    { "searchable": false, "targets": [3] }
	  ]
	});
	$('#admin_payments').dataTable( {
	  "columnDefs": [
	    { "orderable": false, "targets": [3] },
	    { "searchable": false, "targets": [3] }
	  ]
	});
}

$(document).on('page:load ready', ready);