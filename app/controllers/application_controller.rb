class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 

  # def after_sign_in_path_for(resource)  	
  #   # debugger
  # 	if resource.seller
  # 		redirect_to welcome_sellers_path
  # 	elsif resource.tailor
  # 		redirect_to welcome_tailors_path
  # 	elsif resource.admin
  #     redirect_to welcome_admins_path
  #   else
  #     return if resource.sign_in_count==1
  # 		redirect_to root_path
  # 	end  			
  # end

  private
  def admin_required
    unless current_user && current_user.admin
      flash[:error]="You are not allowed to access this page"
      return redirect_to welcome_admins_path
    end    
  end
end
