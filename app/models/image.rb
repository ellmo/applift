class Image < ActiveRecord::Base
  attr_accessible :image_file
  has_attached_file :image_file

  belongs_to :gadget
end
