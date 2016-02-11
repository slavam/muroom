class Actor < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  validates_numericality_of :eye_left_y, presence: true, :only_integer => true, :greater_than => 0
  validates_numericality_of :eye_left_x, presence: true, :only_integer => true, :greater_than => 0
  validates_numericality_of :eye_right_y, presence: true, :only_integer => true, :greater_than => 0
  validates_numericality_of :eye_right_x, presence: true, :only_integer => true, :greater_than => 0
  validate  :eyes_x_coords
  validate  :picture_size

  private

    # Validates x-coordinates left and right eyes
    def eyes_x_coords
      if self.eye_right_x > eye_left_x
        errors.add(:picture, "x coord of right eye should be less than x coord left eye")
      end
    end
    
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
