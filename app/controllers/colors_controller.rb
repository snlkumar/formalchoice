class ColorsController < ApplicationController
	before_filter :admin_required, only: [:new, :edit, :create, :update]
	layout 'admin'
	def index
		@colors = Color.all
	end

	def new
		@color = Color.new
	end

	def edit
		@color = Color.find params[:id]
	end

	def create
		@color = Color.new color_params
		if @color.save
			flash[:notice] ="The record save successfully."
			redirect_to admin_colors_path(current_user.admin)
		else
			render "new"
		end
	end

	def update
		@color  = Color.find params[:id] 
		if @color.update_attributes(color_params)
			flash[:notice] ="The record updated successfully."
			redirect_to admin_colors_path(current_user.admin)
		else
			redirect_to :back
		end
	end

	private
	def color_params
		params[:color].permit!
	end
end
