class SellersController < ApplicationController
	layout 'admin'
	include ProductsHelper
	def signup
		@seller = Seller.new
		@seller.build_user
	end

	def create
		@seller = Seller.new seller_params
		if @seller.save
			flash[:notice] = "You have subscribed successfully.Admin will approve you then you will be able to login into system."
			redirect_to welcome_sellers_path
		else
			redirect_to :back
		end
	end

	def welcome
	end

	def products		
		@products = current_user.seller.products.where(created_at: (3.weeks.ago.to_date..Date.today)).order('created_at ASC').paginate(:page => params[:page], :per_page =>5)
	end

	def ajax_products	
		@products = current_user.seller.products.where(created_at: (Date.parse(params[:from])..Date.parse(params[:to]))).order('created_at ASC').paginate(:page => params[:page], :per_page =>5)
		@graph = render_to_string(partial: "product_graph")
		@plist = render_to_string(partial: "product_list")
		render json: {graph: @graph, list: @plist}
	end

	private
	def seller_params
		params[:seller].permit!
	end
end
