class LocalDevise::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters  
# NOTE: some functionality has been removed for this project - check parent controller

  def create
    build_resource(sign_up_params)
    resource.role = User.user_role

    if resource.save
      if resource.active_for_authentication?
        sign_in(resource_name, resource)
        log_sign_in
        set_msg t(:signed_up, :scope => 'devise.registrations')
      else
        set_msg t(:"signed_up_but_#{resource.inactive_message}", :scope => 'devise.registrations')
        expire_data_after_sign_in!
      end
    else
      clean_up_passwords resource
      respond_to do |format|
        format.js { render :action => "failed_new" }
      end
    end
  end
  
  # Comment from Devise parent controller: 
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    if resource.update_with_password(resource_params)
      sign_in resource_name, resource, :bypass => true
      if resource.email_unconfirmed?
        set_msg t(:updated_email, :scope => 'myinfo.devise.messages')
      else
        set_msg t(:updated, :scope => 'devise.registrations')
      end
    else
      clean_up_passwords resource
      respond_to do |format|
        format.js { render :action => "failed_edit" }
      end
    end
  end 
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:role, :username, :user_attributes)
  end
end
