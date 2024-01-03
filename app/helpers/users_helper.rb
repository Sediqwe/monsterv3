module UsersHelper
    def user_image_tag(user, tag)
        if user.photo.present?
          image = MiniMagick::Image.open(user.photo)
          image.crop("200x200+0+0") 
          image_path = Rails.root.join('public', 'assets', user.photo.filename.to_s)
          image.write(image_path)
        
          image_tag("/assets/#{user.photo.filename}", class: "#{tag} wid-50 rounded-circle", alt: "user-image")
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
