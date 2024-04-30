class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search

  def set_search
    @q = Game.ransack(params[:q])
  end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
    def user_image_tag(user, tag)
      if user.photo.present?
        image_tag(user.photo, class: "#{tag} wid-50  rounded-circle", alt: "user-image")
      else
        image_tag(user.gravatar_image(size: 200), class: "#{tag} wid-50 rounded-circle", alt: "user-image")
      end
    end

end
