class ImagesController < ApplicationController
	layout 'admin'
	def edit
		@image = Image.find params[:id]
	end

	def update
		@image = Image.find params[:id]
		@image.update_attributes(params[:image].permit!) if params[:image]
 		render 'edit'
	end
end
