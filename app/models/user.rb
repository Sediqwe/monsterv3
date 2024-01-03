class User < ApplicationRecord
    has_secure_password
    before_save { self.name = name.downcase }
    

 
    validates :email, uniqueness: { case_sensitive: false }, presence: true, length: {minimum: 5, maximum:100}
    validates :name, uniqueness: { case_sensitive: false }, presence: true, length: {minimum: 2, maximum:100}
    has_many :game
    has_one :translater
    has_one_attached :photo , dependent: :delete_all
    def gravatar_image(size: 150)
        email_hash = Digest::MD5.hexdigest(email.downcase.strip)
        gravatar_url = "https://www.gravatar.com/avatar/#{email_hash}?s=#{size}"        
    end
    def resize_before_save(image_param, width, height)
      return unless image_param
    
      begin
        ImageProcessing::MiniMagick
          .source(image_param)
          .resize_to_fit(width, height)
          .call(destination: image_param.tempfile.path)
      rescue StandardError => _e
        # Do nothing. If this is catching, it probably means the
        # file type is incorrect, which can be caught later by
        # model validations.
      end
    end
end
