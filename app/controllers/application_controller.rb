class ApplicationController < ActionController::Base
  before_action :confirgure_permitted_perameters, if: :devise_controller?

  def current_company
    return nil unless user_signed_in?

    @current_company ||= current_user.company
  end
  helper_method :current_company

  private

  def confirgure_permitted_perameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email, :password, :password_confirmation, company_attributes: [:id, :name, :_destroy])
    end
  end
end
