class Profile < ActiveRecord::Base
  belongs_to :user
  has_one_attached :avatar
  validate :acceptable_image
  
  def acceptable_image
    return unless avatar.attached?
  
    unless avatar.byte_size <= 1.megabyte
     
    end
  
    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
      
    end
  end
  
  
end