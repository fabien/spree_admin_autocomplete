$(function(){ 
  
  // depends on bassistance.de's autocomplete, not jQuery UI
  
  $('tr.product_property td.value input[type=text]').live('keydown', function() {
    if (!$(this).hasClass('ac_input')) {
      var property = $(this).closest('tr.product_property').find('td.property_name input[type=text]');
      var locale = $(this).siblings('input[id$="_locale"]').val();
      $(this).autocomplete('/admin/properties/autocomplete', {
         extraParams: {
             property: function() { return property.val(); },
             locale: locale
         }
      });
      $(this).focus();
    }
  });
  
});