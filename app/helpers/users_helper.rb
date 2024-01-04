module UsersHelper
    def user_image_tag(user, tag)
        if user.photo.present?
          image_tag(user.photo, class: "#{tag} wid-50  rounded-circle", alt: "user-image")
        else
          image_tag(user.gravatar_image(size: 200), class: "#{tag} wid-50 rounded-circle", alt: "user-image")
        end
      end
      
      
      
      
    
    def user_image_tag2(user, tag)
        if user.photo.present?
        image = MiniMagick::Image.open(user.photo)
        image.resize("200 x 200")
        image_tag image.path, class: "#{tag} wid-50 rounded-circle", alt: "user-image"
        else
        image_tag user.gravatar_image(size: 200), class: "#{tag} wid-50 rounded-circle", alt: "user-image"
        end
    end
end
