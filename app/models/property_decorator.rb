Property.class_eval do
  
  scope :by_name, lambda { |name| where("lower(properties.name) = ?", name.downcase) }
  
end