class Image < ActiveRecord::Base
  attr_accessible :gadget, :image_file, :image_file_file_name
  has_attached_file :image_file

  belongs_to :gadget

  ALLOWED_MIMES = ["image/jpeg", "image/png"]

  validate :check_attachment

  def check_attachment
    if (MIME::Types.type_for(image_file_file_name).map(&:to_s) & ALLOWED_MIMES).empty?
      errors[:image_file] << "File must be a valid JPG / PNG image"
    end
    if image_file.size > 1.megabyte
      errors[:image_file] << "File must not be over 1 MB"
    end
  end

end
