Admin::PropertiesController.class_eval do
  
  def autocomplete
    @property = Property.by_name(params[:property]).first
    if @property
      if ProductProperty.respond_to?(:translation_class)
        scope = ProductProperty.translation_class.select("DISTINCT(value)").where('product_property_id IN (?)', @property.product_properties.map { |p| p.id }).order("value")
        scope = scope.where(:locale => params[:locale]) if params[:locale]
      else
        scope = ProductProperty.select("DISTINCT(value)").where("property_id = ?", @property).order("value")
      end
      @values = (params[:q] == '?' ? scope : scope.where("lower(value) LIKE ?", "#{params[:q].downcase}%")).map { |p| p.value }
      render :text => @values.join("\n")
    else
      render :text => ''
    end
  end
  
end