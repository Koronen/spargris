// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  // Token input for transaction tags
	function split( val ) {
		return val.split( /,\s*/ );
	}

	function extractLast( term ) {
		return split( term ).pop();
	}

	$("#transaction_tag_list")
		// don't navigate away from the field on tab when selecting an item
		.bind( "keydown", function( event ) {
			if ( event.keyCode === $.ui.keyCode.TAB &&
					$( this ).data( "autocomplete" ).menu.active ) {
				event.preventDefault();
			}
		})
		.autocomplete({
			source: function( request, response ) {
				$.getJSON( "/tags", {
					q: extractLast( request.term )
				}, response );
			},
			focus: function() {
				// prevent value inserted on focus
				return false;
			},
			select: function( event, ui ) {
				var terms = split( this.value );
				// remove the current input
				terms.pop();
				// add the selected item
				terms.push( ui.item.name );
				// add placeholder to get the comma-and-space at the end
				terms.push( "" );
				this.value = terms.join( ", " );
				return false;
			}
		});

    $('#transaction_timestamp').datetimepicker({ dateFormat: 'yy-mm-dd', timeFormat: 'hh:mm:ss' });

     $( "#transaction_vendor_name" ).autocomplete({
       source: "/vendors",
       minLength: 2,
     });
});
