Deface::Override.new(
  :virtual_path => "spree/admin/product_properties/_product_property_fields",
  :name => "product_property_fields_replacement",
  :replace => "[data-hook=product_property]",
  :partial => "spree/admin/product_properties/product_property_fields_replacement",
  :disabled => false)