Spree::Property.class_eval do
  
  scope :by_name, lambda { |name| where("lower(spree_properties.name) = ?", name.downcase) }
  
end