class HomeController < ApplicationController
	layout "home"
	def index
	    if is_msg?
	      flash.now[:notice] = current_msg
	      clear_msg
	    end
  	end
  	
	def login
	end
end
