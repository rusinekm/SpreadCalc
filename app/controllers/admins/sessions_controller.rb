class Admins::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  def new

    if request.xhr?
      self.resource = resource_class.new(sign_in_params)
      clean_up_passwords(resource)
      render partial: 'new_session_form'
    else
      super
    end
  end

  def create
    super
  end

  def destroy
    super
  end

end
