class SessionsController < Devise::SessionsController
	
	def new		
	  super
	end

	def admin_new		
	  new
	end

	def seller_new		
	  new
	end

	def tailor_new		
	  new
	end

	def create
		logger.info "Attempt to sign in by #{ params[:user][:email] } and #{request.original_url} and #{params[:controller]}"
        @user = User.find_by_email(params[:user][:email])  
        unless @user.role == params[:role]
        	flash[:error] = "You are not allowed to login on this portal."
        	return redirect_to :back
        end if @user         
        self.resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failour")
	    set_flash_message(:notice, :signed_in) if is_navigational_format?
	    sign_in(resource_name, resource)	    
	    if !session[:return_to].blank?
	      redirect_to session[:return_to]
	      session[:return_to] = nil
	    else
	       after_sign_in_path_for(resource)
	    end
	end

	def failour
		flash[:error] = "invalid crediential"
		return redirect_to :back		
	end
end