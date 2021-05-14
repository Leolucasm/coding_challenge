class ApplicationController < ActionController::Base
  def alter_language
    I18n.locale = params[:language] if params[:language].present? && I18n.available_locales.include?(params[:language].to_sym)
    redirect_back fallback_location: root_path
  end
end
