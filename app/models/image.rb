class Image < ActiveRecord::Base
  belongs_to :gadget
  # attr_accessible :title, :body
end
