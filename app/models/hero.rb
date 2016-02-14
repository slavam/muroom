class Hero < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  validates :title, length: { maximum: 200 }
  validates :description, length: { maximum: 200 }
  validates_numericality_of :eye_right_x, :only_integer => true, :allow_nil => false, :greater_than_or_equal_to => 0
  validates_numericality_of :eye_right_y, :only_integer => true, :allow_nil => false, :greater_than_or_equal_to => 0
  validates_numericality_of :eye_left_x, :only_integer => true, :allow_nil => false, :greater_than_or_equal_to => 0
  validates_numericality_of :eye_left_y, :only_integer => true, :allow_nil => false, :greater_than_or_equal_to => 0
  validate  :eyes_x_coords
  validate  :pair_eyes_set_or_not_set
  validate  :picture_size

  private

    # Validates x-coordinates left and right eyes
    def eyes_x_coords
      if eye_left_x > 0 and eye_right_x > 0
        if eye_right_x > eye_left_x
          errors.add(:picture, "x coord of right eye should be less than x coord left eye")
        end
      end
    end
    
    # Validates coordinates left and right eyes should be zerro or not zerro
    def pair_eyes_set_or_not_set
      if ((eye_left_x + eye_right_x) > 0) and ((eye_left_x * eye_right_x) == 0)
        errors.add(:picture, "coords of right and left eyes should be set/not set")
      end
    end
    
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
