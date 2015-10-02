class OrderStepsController < ApplicationController
	include Wicked::Wizard
	steps :measurement, :confirm

	def show
		p params
		@order_item = OrderItem.find session[:order_item]
		case step
		when :measurement 
			@order_item.build_measurement if @order_item.measurement.nil?
		end
		render_wizard
	end

	def update	 	
		@order_item = OrderItem.find session[:order_item]		
		case step
    	when :measurement    		
		 	@measurement = @order_item.build_measurement
	    	@measurement.update_attributes(order_item_params[:measurement_attributes])		
  		end
  		render_wizard @order_item
	end

	def finish_wizard_path
	  checkouts_path
	end

	private
	def order_item_params
      params.require(:order_item).permit(
        :name, measurement_attributes: Measurement.attribute_names.collect { |att| att.to_sym }
      )
    end
end
