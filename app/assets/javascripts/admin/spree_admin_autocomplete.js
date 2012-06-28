$(function(){ 
  
  // depends on bassistance.de's autocomplete, not jQuery UI
  
  $('tr.product_property td.value input[type=text]').live('keydown', function() {
    if (!$(this).is('ac_input')) {
      var $locale = $(this).siblings('input[id$="_locale"]');
      var property = $(this).closest('tr.product_property').find('td.property_name input[type=text]');
      
      console.log("YES")
      
      $(this).autocomplete({ 
        source: function( request, response ) {
  				$.ajax({
  					url: '/admin/properties/autocomplete',
  					dataType: "json",
  					data: {
  					  term: request.term,
  						property: property.val(),
  						locale: $locale.val()
  					},
  					success: function( data ) {
  						response( $.map( data, function( item ) {
  							return { label: item, value: item	}
  						}));
  					}
  				});
  			}		
      });
      $(this).focus();
    }
  });
  
});