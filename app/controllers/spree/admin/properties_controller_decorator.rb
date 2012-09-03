module Spree
  module Admin
    class PropertiesController < ResourceController
  
      def autocomplete
        @property = Property.by_name(params[:property]).first
        if @property
          if ProductProperty.respond_to?(:translation_class)
            scope = ProductProperty.translation_class.select("DISTINCT(value)").where('spree_product_property_id IN (?)', @property.product_properties.map { |p| p.id }).order("value")
            scope = scope.where(:locale => params[:locale]) if params[:locale]
          else
            scope = ProductProperty.select("DISTINCT(value)").where("property_id = ?", @property).order("value")
          end
          @values = (params[:term] == '?' ? scope : scope.where("lower(value) LIKE ?", "#{params[:term].downcase}%")).map { |p| p.value }
          render :json => @values
        else
          render :json => []
        end
      end
  
    end
  end
end