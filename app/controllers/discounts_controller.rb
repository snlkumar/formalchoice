class DiscountsController < ApplicationController
	layout 'admin'
	def index
		@discounts = Discount.all
	end

	def new
		@discount = Discount.new
	end

	def create
		@discount = Discount.new discount_params
		if @discount.save
			flash[:notice] ="The record save successfully."
			redirect_to admin_discounts_path(current_user.admin)
		else
			render "new"
		end
	end

	def edit
		@discount = Discount.find params[:id]
	end

	def update
		@discount = Discount.find params[:id]
		if @discount.update_attributes(discount_params)
			flash[:notice] ="The record updated successfully."
			redirect_to admin_discounts_path(current_user.admin)
		else
			redirect_to :back
		end
	end

	def destroy
		@discount = Discount.find params[:id]
	end

	private
	def discount_params
		params[:discount].permit!
	end


end
